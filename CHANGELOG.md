# Changelog

## 0.3.0 (2026-01-30)

Full Changelog: [v0.2.2...v0.3.0](https://github.com/rye-com/checkout-intents-ruby/compare/v0.2.2...v0.3.0)

### Features

* add support for idempotency for v2 api ([b94de41](https://github.com/rye-com/checkout-intents-ruby/commit/b94de413ad3cfd4a5a552d2719203f060414d228))
* **api:** introduce lookup product data endpoint ([f4edc38](https://github.com/rye-com/checkout-intents-ruby/commit/f4edc38289d432cbc3f87497274c0798bd88b7ee))
* **api:** introduce offerRetrievalEffort constraint ([0d38c14](https://github.com/rye-com/checkout-intents-ruby/commit/0d38c1491c570ae1c8164ed001eb803d600d8bf1))
* Implement shipping profile -&gt; shipping option calculation ([eb0fa3a](https://github.com/rye-com/checkout-intents-ruby/commit/eb0fa3a0c180fbbc616032f02bb303a154d41cb0))


### Bug Fixes

* **internal:** transformer script to fix references ([8481675](https://github.com/rye-com/checkout-intents-ruby/commit/8481675e295bbfa698b9edb93af9d2c99cd840db))


### Chores

* **internal:** add format step in ci ([ad0d359](https://github.com/rye-com/checkout-intents-ruby/commit/ad0d3594d6b4f92df889e645434dbc5310802216))
* **internal:** format and fix absolute references ([2509f6a](https://github.com/rye-com/checkout-intents-ruby/commit/2509f6af145d3b586fbbde14e94697975d15653c))
* **internal:** format and fix absolute references ([09920e1](https://github.com/rye-com/checkout-intents-ruby/commit/09920e1eef0dc90eb8a0999d9fbcce0b0e12de72))
* **internal:** rename `Product` type ([fdadda4](https://github.com/rye-com/checkout-intents-ruby/commit/fdadda4eefc867d5492376e23b25138c263c0811))
* **internal:** update `actions/checkout` version ([00c3bfa](https://github.com/rye-com/checkout-intents-ruby/commit/00c3bfa75b4fd0d01e040070e37a4e72396ea230))

## 0.2.2 (2026-01-15)

Full Changelog: [v0.2.1...v0.2.2](https://github.com/rye-com/checkout-intents-ruby/compare/v0.2.1...v0.2.2)

### Bug Fixes

* **api:** correctly type quantity as integer ([a85ecbf](https://github.com/rye-com/checkout-intents-ruby/commit/a85ecbf160c0cc4b24dc62357aa5bf47e7f7932a))

## 0.2.1 (2026-01-13)

Full Changelog: [v0.2.0...v0.2.1](https://github.com/rye-com/checkout-intents-ruby/compare/v0.2.0...v0.2.1)

### Bug Fixes

* **api:** handle optional args ([8ef7d2b](https://github.com/rye-com/checkout-intents-ruby/commit/8ef7d2b96781b484a96a4c6c7cb8fff1c52f5a05))

## 0.2.0 (2026-01-12)

Full Changelog: [v0.1.0...v0.2.0](https://github.com/rye-com/checkout-intents-ruby/compare/v0.1.0...v0.2.0)

### Features

* **api:** convert polling helpers to flat keyword args ([0b0893e](https://github.com/rye-com/checkout-intents-ruby/commit/0b0893e255447c6ef35a81196c7481242f7eab8b))


### Chores

* **api:** coerce `quantity` to an `Integer` ([e32b3fc](https://github.com/rye-com/checkout-intents-ruby/commit/e32b3fc5848bfd455cba755cceddfd94f5d40da0))

## 0.1.0 (2026-01-12)

Full Changelog: [v0.0.2...v0.1.0](https://github.com/rye-com/checkout-intents-ruby/compare/v0.0.2...v0.1.0)

### Features

* **api:** add polling helpers ([5209a5f](https://github.com/rye-com/checkout-intents-ruby/commit/5209a5fcb449acf6e4ab52e1711b5c95a5acfa63))
* **api:** auto infer environment value ([d666fbb](https://github.com/rye-com/checkout-intents-ruby/commit/d666fbb211955c2c02c9fb5c88de0dea6240adf1))


### Chores

* **internal:** add request_with_headers method ([89dc817](https://github.com/rye-com/checkout-intents-ruby/commit/89dc817a36404e5231e65ab7f05ebe1e5766c61f))
* move `cgi` into dependencies for ruby 4 ([7674f56](https://github.com/rye-com/checkout-intents-ruby/commit/7674f56727d3e5d940c110eb173d91148224c21b))


### Documentation

* **api:** polling helpers ([465f0a0](https://github.com/rye-com/checkout-intents-ruby/commit/465f0a06848b014fd4e3526ff5c2a01b68f3b7ec))

## 0.0.2 (2026-01-07)

Full Changelog: [v0.0.1...v0.0.2](https://github.com/rye-com/checkout-intents-ruby/compare/v0.0.1...v0.0.2)

### Bug Fixes

* **internal:** format and transform name collided refs ([c4a6c64](https://github.com/rye-com/checkout-intents-ruby/commit/c4a6c64ffd61f7d6b3f109ad9d896c2c6742e417))
* **internal:** snake case `cursorPagination` filename ([3cf0cf2](https://github.com/rye-com/checkout-intents-ruby/commit/3cf0cf2bd3edbecbdf87527a066d4a686499920e))


### Chores

* configure new SDK language ([ee73dec](https://github.com/rye-com/checkout-intents-ruby/commit/ee73dec601f3c6286045a97a8c900ade97e9099f))
* sync repo ([c2a3795](https://github.com/rye-com/checkout-intents-ruby/commit/c2a379536364e5dbdfc5aabfaf20383817a1e2b1))
* update SDK settings ([a11c510](https://github.com/rye-com/checkout-intents-ruby/commit/a11c51015c6bcdbbc51353813a10b4421f9ebf44))
