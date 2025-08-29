# ruby_HashMap

A simple **HashMap** implementation in Ruby designed to practice data structures, hashing, and collision handling. This project implements a custom hash map from scratch using linked lists as buckets.

## Features

- Store key-value pairs with **string keys**.
- Handles collisions using **linked lists** (chaining).
- Automatically **resizes** when load factor is exceeded.
- Provides common hash map operations:
  - `set(key, value)` — add or update key-value pairs
  - `get(key)` — retrieve the value for a key
  - `has?(key)` — check if a key exists
  - `remove(key)` — delete a key-value pair
  - `length` — return the number of stored entries
  - `clear` — remove all entries
  - `keys` — return all keys
  - `values` — return all values
  - `entries` — return all key-value pairs as arrays