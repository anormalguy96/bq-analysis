import json, os
os.makedirs('data', exist_ok=True)

events = [
  {"event_id":"e1","user_id":"u1","event_name":"view_product","event_ts":"2025-09-01T10:00:00Z","properties":{"product_id":"p1","price":19.99}},
  {"event_id":"e2","user_id":"u1","event_name":"add_to_cart","event_ts":"2025-09-01T10:01:00Z","properties":{"product_id":"p1","price":19.99}},
  {"event_id":"e3","user_id":"u2","event_name":"view_product","event_ts":"2025-09-02T11:00:00Z","properties":{"product_id":"p2","price":39.5}}
]
with open('data/sample_events.jsonl','w',encoding='utf8') as f:
    for r in events:
        f.write(json.dumps(r) + "\n")

orders = [
  {"order_id":"o1","user_id":"u1","order_ts":"2025-09-01T10:05:00Z","total_amount":19.99,"currency":"USD","items":[{"product_id":"p1","qty":1,"price":19.99}]},
  {"order_id":"o2","user_id":"u2","order_ts":"2025-09-02T12:00:00Z","total_amount":39.50,"currency":"USD","items":[{"product_id":"p2","qty":1,"price":39.5}]},
  {"order_id":"o3","user_id":"u3","order_ts":"2025-09-03T09:30:00Z","total_amount":59.00,"currency":"USD","items":[{"product_id":"p3","qty":2,"price":29.5}]}
]
with open('data/sample_orders.jsonl','w',encoding='utf8') as f:
    for r in orders:
        f.write(json.dumps(r) + "\n")

print("Wrote data/sample_events.jsonl & data/sample_orders.jsonl")