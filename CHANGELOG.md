# Changelog

## 0.5.0 (2026-02-27)

Full Changelog: [v0.4.0...v0.5.0](https://github.com/rye-com/checkout-intents-ruby/compare/v0.4.0...v0.5.0)

### Features

* Add hidden billing API endpoints for drawdown balance and transactions ([1d0cf2f](https://github.com/rye-com/checkout-intents-ruby/commit/1d0cf2ff495f773989a0db5ba645897d1663fcbb))
* proxy product images through Rye domain ([1c3a824](https://github.com/rye-com/checkout-intents-ruby/commit/1c3a82497f2ffd7deaf9b0df3ae6d9c6ebea796c))


### Bug Fixes

* **internal:** formatting ([48e805b](https://github.com/rye-com/checkout-intents-ruby/commit/48e805b256315431a15d0f37f4f1547c0ae8bcec))


### Chores

* **internal:** improvements ([bf4bc16](https://github.com/rye-com/checkout-intents-ruby/commit/bf4bc16e17bc6f52eca011604bc4fff648c96b0e))

## 0.4.0 (2026-02-25)

Full Changelog: [v0.3.1...v0.4.0](https://github.com/rye-com/checkout-intents-ruby/compare/v0.3.1...v0.4.0)

### Features

* add merchants API endpoint ([fe328c8](https://github.com/rye-com/checkout-intents-ruby/commit/fe328c8624e6918c8fc12116e94ac234c55809c7))
* Add PaymentMethod support for Prava ([14403ec](https://github.com/rye-com/checkout-intents-ruby/commit/14403ec2d12b9cc0b158b1f13f57a4f2562425a5))
* Add stainless updates ([fb15ca9](https://github.com/rye-com/checkout-intents-ruby/commit/fb15ca96cfa2cce055f4b5298337d153a27d01d7))
* Billing: Add BillingReconciliationService for expired drawdown orders ([bfdf7c7](https://github.com/rye-com/checkout-intents-ruby/commit/bfdf7c7623d2f67ded81d7d4b42586c7761b9587))
* Billing: Add BillingReconciliationService for expired drawdown orders ([4c5cc0c](https://github.com/rye-com/checkout-intents-ruby/commit/4c5cc0c21cf3fff1dd814f0980f391769f991903))
* Billing: Envelope payment processing fields ([4883dbc](https://github.com/rye-com/checkout-intents-ruby/commit/4883dbce3f4f94f6f479b7e9c7590acc3f4f98fe))
* Billing: Integrate drawdown payments in order flow ([fc96bce](https://github.com/rye-com/checkout-intents-ruby/commit/fc96bce1e2161b0e860d966a4c0dcd95088ae650))
* Centralize Shopify domain resolution into ShopifyDomainResolver service ([667747d](https://github.com/rye-com/checkout-intents-ruby/commit/667747d078a9f4cb4f21610de3f8845792a107e9))
* Enable searching checkoutIntent by order Id on dev console ([e4e1d60](https://github.com/rye-com/checkout-intents-ruby/commit/e4e1d60fcd31fe16a114657e0d88c5198ca31470))
* integrate promo codes discovery to checkout intent flow ([0a853b4](https://github.com/rye-com/checkout-intents-ruby/commit/0a853b42afa15f3ebd965056fe939581d7d8d5b5))
* Phase 3: Strategy Interface + Normalizer ([f7a8093](https://github.com/rye-com/checkout-intents-ruby/commit/f7a809350d9d2b47d3e33fa15c934423b3890769))
* Remove `shipments` from our stainless config ([647f966](https://github.com/rye-com/checkout-intents-ruby/commit/647f966aa6283367a86bb6b1bb1016d0b7baa1b6))
* Remove duplicate method from controller ([bdbda16](https://github.com/rye-com/checkout-intents-ruby/commit/bdbda16d7cd63db41d9253625d6a6a1ed8715acf))
* Store estimated delivery date on completed checkout intent ([1114b43](https://github.com/rye-com/checkout-intents-ruby/commit/1114b4326c1a372f33d6cc17171db0192ed4d40c))
* Store estimated delivery date on completed checkout intent ([cce80b5](https://github.com/rye-com/checkout-intents-ruby/commit/cce80b5171fba2b7573b5ce27bd328c4cbc9d194))
* Unwrap `rd.bizrate.com` affiliate URLs ([9b31371](https://github.com/rye-com/checkout-intents-ruby/commit/9b3137194da902b632001a16756a6bd3df4a1770))
* Unwrap `rd.bizrate.com` affiliate URLs ([5620d06](https://github.com/rye-com/checkout-intents-ruby/commit/5620d06a52adba2842dc67e9acb8c38574fcff24))
* Update return states to better reflect return lifecycle ([7b2053f](https://github.com/rye-com/checkout-intents-ruby/commit/7b2053f24007e8f3d401b7a73b0c4ad1c7856191))
* wire up wizard layout and pass layout type through JWT ([3b5be9b](https://github.com/rye-com/checkout-intents-ruby/commit/3b5be9bdba3d7e1c5f13530aae7348028928974b))


### Bug Fixes

* **client:** always add content-length to post body, even when empty ([cf0a01b](https://github.com/rye-com/checkout-intents-ruby/commit/cf0a01b9aea9660921b37245e054d7d3c4bc6589))
* **client:** loosen json header parsing ([370e9f1](https://github.com/rye-com/checkout-intents-ruby/commit/370e9f183a4a01425a6ed55f1f587cec1ce0051b))
* **internal:** auto-correct style issues on format ([0996321](https://github.com/rye-com/checkout-intents-ruby/commit/0996321f2b40af55bfa1f5f7c1440b536465e3ec))
* **internal:** expand `fix-absolute-references` script ([bb4c3db](https://github.com/rye-com/checkout-intents-ruby/commit/bb4c3db1a0919f5196c6de982bc31568f1f95c02))


### Chores

* **docs:** remove www prefix ([94872c2](https://github.com/rye-com/checkout-intents-ruby/commit/94872c23c918df8535960a872609a82355b0a8f1))
* **internal:** format and fix absolute references ([b804e1a](https://github.com/rye-com/checkout-intents-ruby/commit/b804e1a10bb5e0cde953dc9b459805dce71b4e30))
* **internal:** format and fix absolute references ([398a39c](https://github.com/rye-com/checkout-intents-ruby/commit/398a39ccebcc0aa1e3d9dda3e596c3ba6cffe7db))
* **internal:** format and fix absolute references ([cc55350](https://github.com/rye-com/checkout-intents-ruby/commit/cc55350f01e1e361ea686cf361078082b3fab927))
* **internal:** format and fix absolute references ([a4ef09b](https://github.com/rye-com/checkout-intents-ruby/commit/a4ef09b368112fda02705a6203d5c5e7e4e2eaeb))
* **internal:** format and fix absolute references ([a52c0ba](https://github.com/rye-com/checkout-intents-ruby/commit/a52c0ba29741ebcba333a77c353157ce57388fae))
* **internal:** format and fix absolute references ([044f29e](https://github.com/rye-com/checkout-intents-ruby/commit/044f29e1e7c25ccfa25d1a43e0b730fe6964fc0b))
* **internal:** format and fix absolute references ([9cca341](https://github.com/rye-com/checkout-intents-ruby/commit/9cca34174d75aee7798f4bbea375e5f6f4955c15))
* **internal:** format and fix absolute references ([c7e748d](https://github.com/rye-com/checkout-intents-ruby/commit/c7e748d8a4114448c505310c30add13357800b12))
* **internal:** format and fix absolute references ([37f8e6f](https://github.com/rye-com/checkout-intents-ruby/commit/37f8e6f6ce31b7e44b6a71aecb45682e061d888c))
* **internal:** format and fix absolute references ([1d010c4](https://github.com/rye-com/checkout-intents-ruby/commit/1d010c4d9e2c3387efdde6d5a4019d94e7757607))
* **internal:** format and fix absolute references ([2890fe0](https://github.com/rye-com/checkout-intents-ruby/commit/2890fe035123d6af0bb4f7de2252af919cdc285d))
* **internal:** improvements ([9d65299](https://github.com/rye-com/checkout-intents-ruby/commit/9d652994c7618deb3479d73f5fc56c4ef0fa1878))
* **internal:** improvements ([826f76c](https://github.com/rye-com/checkout-intents-ruby/commit/826f76c459e35ee6327f7c8910a7c399cef9e9f5))
* **internal:** improvements ([b8d678f](https://github.com/rye-com/checkout-intents-ruby/commit/b8d678ffd041f631487709fea369fc2ac0184d6f))
* **internal:** move polling helpers ([4e74c7f](https://github.com/rye-com/checkout-intents-ruby/commit/4e74c7fe0b32260c63980e9e9bbe2185966a0df2))
* **internal:** remove mock server code ([43ad79f](https://github.com/rye-com/checkout-intents-ruby/commit/43ad79f58124c6f40fc9ae6a95a59f5404ea6a0f))
* update mock server docs ([47ac5a6](https://github.com/rye-com/checkout-intents-ruby/commit/47ac5a65f13964ea4c0e764023fe2a802612657b))

## 0.3.1 (2026-01-30)

Full Changelog: [v0.3.0...v0.3.1](https://github.com/rye-com/checkout-intents-ruby/compare/v0.3.0...v0.3.1)

### Chores

* **docs:** rename "retrieve product" to "lookup product" ([5a82e7b](https://github.com/rye-com/checkout-intents-ruby/commit/5a82e7b749e629dc316b69a72efb918072c21f6e))

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
