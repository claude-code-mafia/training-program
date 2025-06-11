#!/usr/bin/env python3
import json
import sys

# Test different JSON output scenarios
test_data = {
    "simple": {"name": "test", "value": 123},
    "nested": {
        "level1": {
            "level2": {
                "items": ["a", "b", "c"],
                "count": 3
            }
        }
    },
    "array": [1, 2, 3, 4, 5],
    "mixed": {
        "string": "hello",
        "number": 42,
        "boolean": True,
        "null": None,
        "array": [1, "two", 3.14],
        "object": {"key": "value"}
    }
}

# Pretty print JSON
print("=== Pretty JSON ===")
print(json.dumps(test_data, indent=2))

print("\n=== Compact JSON ===")
print(json.dumps(test_data))

print("\n=== Custom JSON Output ===")
custom_output = {
    "status": "success",
    "timestamp": "2025-01-06T12:00:00Z",
    "results": [
        {"id": 1, "name": "Item 1"},
        {"id": 2, "name": "Item 2"}
    ]
}
print(json.dumps(custom_output, indent=2))