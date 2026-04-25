## What this is
This repository provides a reference implementation of a universal product data schema tailored for CPG retail. It is specifically designed to solve the "N×M" onboarding problem—where every new brand-to-retailer connection currently requires a custom integration—by providing a standardized, interoperable framework for product information exchange.

## The Design Principles
The full design rationale and architectural philosophy behind this schema can be found in [this blog post](https://www.bridgecomm.ai/data-schema-interoperability-lesson/) on [bridgecomm.ai](https://www.bridgecomm.ai/). We recommend reviewing that post for a deep dive into the logic governing these structures.

## Repository Contents

* schema.json: The core JSON Schema definition for universal product attributes.
* examples/: A collection of sample payloads for common CPG categories (e.g., Beverage, Snacks).
* scripts/: DDL for the canonical model schema

## How to use it
Developers can integrate this schema by importing the schema.json into their validation pipeline to standardize incoming partner data. To adapt it for specific needs, simply extend the core definitions or use the provided boilerplate to map legacy internal formats to the universal standard.

## License
This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## About BridgeCommAI
BridgeCommAI builds intelligent infrastructure to streamline data exchange across the retail ecosystem. Learn more about our mission at [bridgecomm.ai](https://www.bridgecomm.ai/)