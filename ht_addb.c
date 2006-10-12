#include "alloc.h"
#include "bin.h"
#include "error.h"
#include "hashtable.h"

static int new_node(struct ht_table_node **tn,
                    unsigned long klen, unsigned long xlen)
{
  struct ht_table_node *tmp;

  tmp = alloc(sizeof(struct ht_table_node));
  if (!tmp) return 0;
  tmp->key = alloc(klen);
  if (!tmp->key) {
    dealloc(tmp);
    return 0;
  }
  tmp->data = alloc(xlen);
  if (!tmp->data) {
    dealloc(tmp->key);
    dealloc(tmp);
    return 0;
  }
  tmp->next = 0;
  *tn = tmp;
  return 1;
}

int ht_addb(hashtable *h, const void *k, unsigned long klen,
                          const void *x, unsigned long xlen)
{
  struct ht_table_head *th;
  struct ht_table_node *tn;
  struct ht_table_node *fu;
  struct ht_table_node *np;
  unsigned long pos;
  const char *key;
  const char *dat;

  key = (const char *) k;
  dat = (const char *) x;
  pos = ht_hash(key, klen) % HT_HASH_BUCKETS;
  th = &(h->slots[pos]);

  /* check that more can be added */
  if ((th->used + 1) < th->used) { errno = error_overflow; return -1; }

  /* nothing allocated? new head */
  if (!th->allocd) {
    if (!new_node(&tn, klen, xlen)) return -1;
    ++th->allocd;
    th->head = tn;
    goto SET;
  }

  /* key already taken? (also mark first unused node) */
  fu = 0;
  np = th->head;
  if (th->used) {
    for (;;) {
      if (np->state == HT_SLOT_UNUSED) {
        if (!fu) fu = np;
      } else {
        if (bin_same(np->key, key, klen)) return 0; /* key collision */
      }
      if (np->next)
        np = np->next;
      else
        break; /* no matching node */
    }
  } else fu = th->head; /* allocated but none used, use first node */

  /* if there was an unused node, re-use it */
  if (fu) {
    fu->key = alloc(klen);
    if (!fu->key) return -1;
    fu->data = alloc(xlen);
    if (!fu->data) { dealloc(fu->key); return -1; }
    tn = fu;
  } else {
    if ((th->allocd + 1) < th->allocd) { errno = error_overflow; return -1; }
    if (!new_node(&tn, klen, xlen)) return -1;
    ++th->allocd;
    np->next = tn;
  }

  SET:
  ++th->used;
  tn->state = HT_SLOT_USED;
  tn->keylen = klen;
  tn->datalen = xlen;
  bin_copy(key, tn->key, klen);
  bin_copy(dat, tn->data, xlen);
  return 1;
}
