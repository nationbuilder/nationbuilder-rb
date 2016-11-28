# 1.4.3
- [#34] Fix `Content-Type` header check

# 1.3.5
- [#21] Added limit params to Paginator class

# 1.3.2
- When retrying requests, the request is actually resent instead
  of just reparsing the response
- [#12] Raise an error if the last API request retry is rate limited

# 1.3
- [#10] Support fire_webhooks parameter in client

# 1.2.3
- Return true for non-JSON responses

# 1.2.2
- The retries parameter on a client should correspond to the number of retries,
  not total calls.

# 1.2.1
- Include Paginator class in NationBuilder module

# 1.2.0
- Native exception types
- [#9] Exponential backoff when encountering rate limit

# 1.1.0
- [#6] Pagination class for iterating through paginated sets
