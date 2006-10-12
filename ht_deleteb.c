#include "alloc.h"
#include "bin.h"
#include "hashtable.h"

int ht_deleteb(hashtable *h, const void *k, unsigned long len)
{
  unsigned long pos;
  struct ht_table_node *np;
  struct ht_table_head *th;
  const char *key;

  key = (const char *) k;
  pos = ht_hash(key, len) % HT_HASH_BUCKETS;
  th = &(h->slots[pos]);
  np = th->head;

  if (!th->used) return 0;

  for (;;) {
    if (np->state == HT_SLOT_USED) {
      if (bin_same(np->key, key, len)) {
        dealloc(np->data);
        dealloc(np->key);
        np->datalen = 0;
        np->keylen = 0;
        np->state = HT_SLOT_UNUSED;
        --th->used;
        return 1;
      }
    }
    if (np->next)
      np = np->next;
    else
      return 0;
  }
}
