# Changelog

## 4.10.0 (2026-04-08)

Full Changelog: [v4.9.0...v4.10.0](https://github.com/trycourier/courier-ruby/compare/v4.9.0...v4.10.0)

### Features

* **api:** add list_notifications method to routing_strategies ([ce8f121](https://github.com/trycourier/courier-ruby/commit/ce8f1217d52377144e053e51497310e71fef1dea))
* **api:** add put_content/put_element/put_locale, remove draft resource, update retrieve_content ([ecb21e4](https://github.com/trycourier/courier-ruby/commit/ecb21e4913ec80513471153abab2e75d80afffb5))

## 4.9.0 (2026-04-01)

Full Changelog: [v4.8.0...v4.9.0](https://github.com/trycourier/courier-ruby/compare/v4.8.0...v4.9.0)

### Features

* **api:** add html variant to elemental_node union ([a5a5a5d](https://github.com/trycourier/courier-ruby/commit/a5a5a5d025d5ddb27a79872b15efaaa08785b032))
* **api:** add notification template CRUD methods, update list params/types ([4861f87](https://github.com/trycourier/courier-ruby/commit/4861f87ead15aba7b148dc8d2790fe2d018157c9))
* **api:** add providers resource with create/retrieve/update/list/delete and catalog ([5191261](https://github.com/trycourier/courier-ruby/commit/519126120e84dea8276094325e49d350eff3f7bc))
* **api:** add routing_strategies resource with create/retrieve/list/replace/archive ([6c64599](https://github.com/trycourier/courier-ruby/commit/6c645999dd54ac75bdb777745363d662f7d9da64))


### Bug Fixes

* align path encoding with RFC 3986 section 3.3 ([916afaa](https://github.com/trycourier/courier-ruby/commit/916afaafd525d4d77a42a0739e892c4d4cf5d933))
* **internal:** correct multipart form field name encoding ([7925b72](https://github.com/trycourier/courier-ruby/commit/7925b72544622783dd17527da1729f6f48ddb744))
* variable name typo ([1f59fd2](https://github.com/trycourier/courier-ruby/commit/1f59fd2c73459908b337b98135efbd79bf0bfb9a))


### Chores

* **ci:** skip lint on metadata-only changes ([22a3e8d](https://github.com/trycourier/courier-ruby/commit/22a3e8d5bbfe6953bca20ba54b7bb2007f4f37c0))
* **ci:** support opting out of skipping builds on metadata-only commits ([a6c047e](https://github.com/trycourier/courier-ruby/commit/a6c047eaa9730f8c398082cd422bf0bc1087e882))
* **internal:** tweak CI branches ([08eccfe](https://github.com/trycourier/courier-ruby/commit/08eccfe4c37358304a97686df7248dc02f6ea0f4))
* **internal:** update gitignore ([95860ac](https://github.com/trycourier/courier-ruby/commit/95860acf54c665132e957913d0fc6187cadaf64c))


### Documentation

* add AGENTS.md for AI coding assistants ([#81](https://github.com/trycourier/courier-ruby/issues/81)) ([ff1b8c2](https://github.com/trycourier/courier-ruby/commit/ff1b8c2e58007e1ccd5e631e07f28daf2027cef2))
* sync README from mintlify-docs (2026-03-23 19:54 UTC) ([#79](https://github.com/trycourier/courier-ruby/issues/79)) ([4b83d99](https://github.com/trycourier/courier-ruby/commit/4b83d99126c8ddedf8e137cfc683bc6be998cc35))

## 4.8.0 (2026-03-12)

Full Changelog: [v4.7.1...v4.8.0](https://github.com/trycourier/courier-ruby/compare/v4.7.1...v4.8.0)

### Features

* **api:** add journeys resource with list and invoke methods ([26a80de](https://github.com/trycourier/courier-ruby/commit/26a80de1aa75c947f63e09da0ae7cb539947ecc4))
* **api:** add provider_key/device/tracking to token params, remove body_token ([acb3031](https://github.com/trycourier/courier-ruby/commit/acb30313188a385e2ad39be4f4040e4e5836106d))
* **api:** remove brand field from ElementalContent model ([519fcc0](https://github.com/trycourier/courier-ruby/commit/519fcc0a2f35a1fd61e64362b5a2e7b2d8225232))


### Bug Fixes

* mark MessageDetails timestamp fields as optional ([31a0be6](https://github.com/trycourier/courier-ruby/commit/31a0be63ee9969176a7bb3a627eabeb7c26d50f6))


### Chores

* **ci:** add build step ([d07ae3d](https://github.com/trycourier/courier-ruby/commit/d07ae3dc073f38ac30af1311f1d70153e441bf51))
* **ci:** skip uploading artifacts on stainless-internal branches ([d4c0636](https://github.com/trycourier/courier-ruby/commit/d4c06361e5ef4e7c0a3a1660215d63fe845694c5))
* **internal:** codegen related update ([3a0f51e](https://github.com/trycourier/courier-ruby/commit/3a0f51e6a03c33097f1307ac7974a3c5ca72ac90))
* **internal:** codegen related update ([1cce4a8](https://github.com/trycourier/courier-ruby/commit/1cce4a8be23782aae7fb9185b8ac2efd06516842))
* **internal:** remove mock server code ([a81351a](https://github.com/trycourier/courier-ruby/commit/a81351a2fde27b8a785a79436394a991e9048d97))
* update mock server docs ([62d69fc](https://github.com/trycourier/courier-ruby/commit/62d69fc657babf8ff535e150d74a2283ddb64459))


### Documentation

* add AUTO-GENERATED-OVERVIEW markers for README sync ([#75](https://github.com/trycourier/courier-ruby/issues/75)) ([ab86102](https://github.com/trycourier/courier-ruby/commit/ab86102437d2af03dc45beae7262371c70b6847f))
* sync README from mintlify-docs (2026-02-20 18:11 UTC) ([#76](https://github.com/trycourier/courier-ruby/issues/76)) ([cc67458](https://github.com/trycourier/courier-ruby/commit/cc6745816e152b890b84caaf666178bdbd9d3192))

## 4.7.1 (2026-02-07)

Full Changelog: [v4.7.0...v4.7.1](https://github.com/trycourier/courier-ruby/compare/v4.7.0...v4.7.1)

### Bug Fixes

* **client:** loosen json header parsing ([70d1c0d](https://github.com/trycourier/courier-ruby/commit/70d1c0d55a6982b059be2809cae088351ba7f112))

## 4.7.0 (2026-02-06)

Full Changelog: [v4.6.3...v4.7.0](https://github.com/trycourier/courier-ruby/compare/v4.6.3...v4.7.0)

### Features

* **api:** add array support to send_message to parameter ([02f83d3](https://github.com/trycourier/courier-ruby/commit/02f83d3b73bea1b85a5bda3fe30080e0e807f753))
* **api:** add publish/replace methods and versions sub-resource to tenants templates ([7642e1b](https://github.com/trycourier/courier-ruby/commit/7642e1b9f7433ae5046f4a170c11479aee626cc4))


### Bug Fixes

* **client:** always add content-length to post body, even when empty ([2045d2e](https://github.com/trycourier/courier-ruby/commit/2045d2e9d416abe826dd87ff993838407784dccc))


### Chores

* **docs:** remove www prefix ([8667b7a](https://github.com/trycourier/courier-ruby/commit/8667b7a6f52b4559e4f941b78b724b94f393b996))

## 4.6.3 (2026-01-27)

Full Changelog: [v4.6.2...v4.6.3](https://github.com/trycourier/courier-ruby/compare/v4.6.2...v4.6.3)

### Chores

* **internal:** update `actions/checkout` version ([58351ff](https://github.com/trycourier/courier-ruby/commit/58351ffafedee9170ccedf73d79c2c87fe84ca7b))


### Documentation

* **types:** update version field description in AutomationTemplate ([df81741](https://github.com/trycourier/courier-ruby/commit/df8174149d84e67dd15ca2e54b45ac3e4682039a))

## 4.6.2 (2026-01-14)

Full Changelog: [v4.6.1...v4.6.2](https://github.com/trycourier/courier-ruby/compare/v4.6.1...v4.6.2)

### Chores

* fix typo in descriptions ([620d8d1](https://github.com/trycourier/courier-ruby/commit/620d8d14300bc3ca8a7c53ba0e6475d251773f98))
* **internal:** regenerate SDK with no functional changes ([258dc3c](https://github.com/trycourier/courier-ruby/commit/258dc3c812e714cb593afbbba68c4f64be184741))
* **internal:** regenerate SDK with no functional changes ([87e9439](https://github.com/trycourier/courier-ruby/commit/87e943981b53c04bb806af69a3a5293c4ffa5f5b))
* remove custom code ([7ada104](https://github.com/trycourier/courier-ruby/commit/7ada104121a203cfcc3bbc0d05bd818bfbbcf834))

## 4.6.1 (2026-01-12)

Full Changelog: [v4.6.0...v4.6.1](https://github.com/trycourier/courier-ruby/compare/v4.6.0...v4.6.1)

### Bug Fixes

* **types:** correct rules field type to Filter in NestedFilterConfig ([3c9897c](https://github.com/trycourier/courier-ruby/commit/3c9897c45406cf07f9981a953030c43c10f224c1))


### Chores

* **internal:** regenerate SDK with no functional changes ([a8e483c](https://github.com/trycourier/courier-ruby/commit/a8e483c224a1ae70128b7eb379e9356d68175d95))
* move `cgi` into dependencies for ruby 4 ([854537a](https://github.com/trycourier/courier-ruby/commit/854537a6a4127b10ac19f8cd43f412e54c776385))

## 4.6.0 (2026-01-08)

Full Changelog: [v4.5.0...v4.6.0](https://github.com/trycourier/courier-ruby/compare/v4.5.0...v4.6.0)

### Features

* **api:** remove audit_events, automations, brands, bulk, inbound, translations endpoints ([f9f04c1](https://github.com/trycourier/courier-ruby/commit/f9f04c1760b4dceb5ed966449ddb19cd4bc72182))

## 4.5.0 (2025-12-29)

Full Changelog: [v4.4.0...v4.5.0](https://github.com/trycourier/courier-ruby/compare/v4.4.0...v4.5.0)

### Features

* **api:** add slack/msteams/pagerduty/webhook/audience/list recipient types ([56278ef](https://github.com/trycourier/courier-ruby/commit/56278ef7d0582bfba2e2122f9682c1282f25109d))


### Bug Fixes

* calling `break` out of streams should be instantaneous ([7af6435](https://github.com/trycourier/courier-ruby/commit/7af6435d8426c69cb9c07d263d3363526508be7d))
* issue where json.parse errors when receiving HTTP 204 with nobody ([6288d57](https://github.com/trycourier/courier-ruby/commit/6288d578db512479a70098e529a26a0e29139918))

## 4.4.0 (2025-12-16)

Full Changelog: [v4.3.0...v4.4.0](https://github.com/trycourier/courier-ruby/compare/v4.3.0...v4.4.0)

### Features

* Add timezone field to Delay schema ([980df61](https://github.com/trycourier/courier-ruby/commit/980df617cffc47a231bac77a4250ef4e409cb57c))
* Update bulk API spec: make event required, document profile.email req… ([73718b3](https://github.com/trycourier/courier-ruby/commit/73718b3e6c13e0a3ac1bc5487eb07953f435a956))

## 4.3.0 (2025-12-08)

Full Changelog: [v4.2.0...v4.3.0](https://github.com/trycourier/courier-ruby/compare/v4.2.0...v4.3.0)

### Features

* Fix UsersGetAllTokensResponse to return object with tokens property i… ([dad98a1](https://github.com/trycourier/courier-ruby/commit/dad98a163d391bf45510d10c10d2d7597e1af74e))

## 4.2.0 (2025-12-08)

Full Changelog: [v4.1.1...v4.2.0](https://github.com/trycourier/courier-ruby/compare/v4.1.1...v4.2.0)

### Features

* Add event_ids field to Notification schema ([cbb73f5](https://github.com/trycourier/courier-ruby/commit/cbb73f50ae03cabc7b2023b6ed337cec5e6b7ad8))


### Bug Fixes

* **client:** fix duplicate Go struct resulting from name derivations schema ([9e12a1e](https://github.com/trycourier/courier-ruby/commit/9e12a1ec6f4f230533c524e0c597159072664350))

## 4.1.1 (2025-12-02)

Full Changelog: [v4.1.0...v4.1.1](https://github.com/trycourier/courier-ruby/compare/v4.1.0...v4.1.1)

### Chores

* explicitly require "base64" gem ([0dccbc1](https://github.com/trycourier/courier-ruby/commit/0dccbc120b6772d2343f3990bd11f0ed03b736bf))

## 4.1.0 (2025-11-18)

Full Changelog: [v4.0.0...v4.1.0](https://github.com/trycourier/courier-ruby/compare/v4.0.0...v4.1.0)

### Features

* JWT scope updates ([4d36db2](https://github.com/trycourier/courier-ruby/commit/4d36db263ca5cdb2749a1f118b43021d0848cb7a))
* NPM enabled ([4f2235d](https://github.com/trycourier/courier-ruby/commit/4f2235d54287d1792ecc6ffae986510e1deb47a4))
* Test ([dbc83af](https://github.com/trycourier/courier-ruby/commit/dbc83af1bb3c96f874766e751e21ca051cc5d4c4))

## 4.0.0 (2025-11-12)

Full Changelog: [v3.4.0-alpha9...v4.0.0](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha9...v4.0.0)

### Features

* Spec Comment Change ([b567eac](https://github.com/trycourier/courier-ruby/commit/b567eac8556068aa9fea18a1882330e741dda479))
* Token Prop Description Change ([cb884a1](https://github.com/trycourier/courier-ruby/commit/cb884a1830d2abaf81db27b14c60725c5792f0fa))


### Chores

* update SDK settings ([3ad8ff3](https://github.com/trycourier/courier-ruby/commit/3ad8ff378645ccd3ecdf5a3b64ccfd8694901c67))

## 3.4.0-alpha9 (2025-11-07)

Full Changelog: [v3.4.0-alpha8...v3.4.0-alpha9](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha8...v3.4.0-alpha9)

### Bug Fixes

* Better Python Samples + Updates to naming ([1d8cd06](https://github.com/trycourier/courier-ruby/commit/1d8cd06d373fa53e940cd05d26ce24005ef93955))

## 3.4.0-alpha8 (2025-11-05)

Full Changelog: [v3.4.0-alpha7...v3.4.0-alpha8](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha7...v3.4.0-alpha8)

### Features

* Attempt kick off again ([a5ffc84](https://github.com/trycourier/courier-ruby/commit/a5ffc84f9ed318eb757d6736eca3562d1d71b2e8))
* Kick off the change (Change to user profile in descriptions) ([f4dc8ff](https://github.com/trycourier/courier-ruby/commit/f4dc8ffe56eb34a7ae471473ead69550db011aaa))
* Organization update ([c6f7b97](https://github.com/trycourier/courier-ruby/commit/c6f7b970508aca2bd1fca5d69e83c76def40058d))


### Bug Fixes

* better thread safety via early initializing SSL store during HTTP client creation ([f3dfeec](https://github.com/trycourier/courier-ruby/commit/f3dfeec90dc59b454f787ef88e0b1a7b2af02ef7))


### Chores

* bump dependency version and update sorbet types ([4d9baaa](https://github.com/trycourier/courier-ruby/commit/4d9baaac7f0ac9365f648ba0a3f10edb646e70a8))

## 3.4.0-alpha7 (2025-10-31)

Full Changelog: [v3.4.0-alpha6...v3.4.0-alpha7](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha6...v3.4.0-alpha7)

### Features

* Comment adjustment to kick of build ([3f53532](https://github.com/trycourier/courier-ruby/commit/3f535324c5b114494cfd28e2570d9fb3c192b6b1))
* handle thread interrupts in the core HTTP client ([27380fe](https://github.com/trycourier/courier-ruby/commit/27380fe7d02178679a46b849acbc5807e3dc4136))


### Bug Fixes

* Comment to kick off build ([bbdb8ce](https://github.com/trycourier/courier-ruby/commit/bbdb8cec3dec051e17a89091f2ea881897e3b532))

## 3.4.0-alpha6 (2025-10-17)

Full Changelog: [v3.4.0-alpha5...v3.4.0-alpha6](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha5...v3.4.0-alpha6)

### Bug Fixes

* Dep Warning ([3439cba](https://github.com/trycourier/courier-ruby/commit/3439cbae785d9e2198cc6af4a19e4e54e9e74c0c))

## 3.4.0-alpha5 (2025-10-17)

Full Changelog: [v3.4.0-alpha4...v3.4.0-alpha5](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha4...v3.4.0-alpha5)

### Bug Fixes

* Updated paths for each model and go example updates ([3589716](https://github.com/trycourier/courier-ruby/commit/358971631427bdec2f3c609aa0b96139ee285503))

## 3.4.0-alpha4 (2025-10-16)

Full Changelog: [v3.4.0-alpha3...v3.4.0-alpha4](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha3...v3.4.0-alpha4)

### Bug Fixes

* absolutely qualified uris should always override the default ([bfd4568](https://github.com/trycourier/courier-ruby/commit/bfd45688b3098e802b5dc1b0cced22900a0be21d))

## 3.4.0-alpha3 (2025-10-15)

Full Changelog: [v3.4.0-alpha2...v3.4.0-alpha3](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha2...v3.4.0-alpha3)

### Features

* Changes to spec, examples and scripts ([09593fd](https://github.com/trycourier/courier-ruby/commit/09593fd20a94ccdf207b2132466f36347e26a7b1))
* More PHP and attempted node automerge ([b09fcca](https://github.com/trycourier/courier-ruby/commit/b09fcca1f67209aaaf4bc7295a7adf1f1b828388))


### Bug Fixes

* should not reuse buffers for `IO.copy_stream` interop ([eb3c0f3](https://github.com/trycourier/courier-ruby/commit/eb3c0f32d5999be7343beb7cdb67d10b1d1b86ad))

## 3.4.0-alpha2 (2025-10-14)

Full Changelog: [v3.4.0-alpha1...v3.4.0-alpha2](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha1...v3.4.0-alpha2)

### Features

* Kick of merge attempt ([9768acd](https://github.com/trycourier/courier-ruby/commit/9768acdb3174098916886962bdc15775092794cb))

## 3.4.0-alpha1 (2025-10-10)

Full Changelog: [v3.4.0-alpha0...v3.4.0-alpha1](https://github.com/trycourier/courier-ruby/compare/v3.4.0-alpha0...v3.4.0-alpha1)

### Features

* **api:** manual updates ([051c3c4](https://github.com/trycourier/courier-ruby/commit/051c3c4722fa39896d01d0841f4989c91aa75c45))
* **api:** manual updates ([ea5dfb3](https://github.com/trycourier/courier-ruby/commit/ea5dfb319688c23cc97da6a6ad80d4837bae04dd))
* **api:** manual updates ([589a36f](https://github.com/trycourier/courier-ruby/commit/589a36f974d97fa73ecdf9a2a9b335492b15b203))
* **api:** manual updates ([373bfde](https://github.com/trycourier/courier-ruby/commit/373bfde900f61ab7d70dcf775bd6aba16559d4df))
* **api:** manual updates ([7c80f38](https://github.com/trycourier/courier-ruby/commit/7c80f3886fee9dc87253362a3eb51fe73cb44827))
* **api:** manual updates ([f6681a9](https://github.com/trycourier/courier-ruby/commit/f6681a932e946bce954e2636f711694339d80471))
* **api:** manual updates ([6a77929](https://github.com/trycourier/courier-ruby/commit/6a779292f8e2479621698d89a344466d95c97eab))
* **api:** manual updates ([ab9922d](https://github.com/trycourier/courier-ruby/commit/ab9922d111846aebe424749ae0cb9668332e3e62))
* **api:** manual updates ([4de89e5](https://github.com/trycourier/courier-ruby/commit/4de89e5fdad38358f42a1fec4835eda07247b57e))
* **api:** manual updates ([babe4b8](https://github.com/trycourier/courier-ruby/commit/babe4b874fe7a4b5f8b306a5ebce7be0baf877e3))
* **api:** manual updates ([91ad238](https://github.com/trycourier/courier-ruby/commit/91ad2389821d60def82ce67ee5f42f3a7f803f1c))
* **api:** manual updates ([f80182f](https://github.com/trycourier/courier-ruby/commit/f80182f49b5abc44e758579d1ab9b475e1f41c95))
* **api:** manual updates ([0d85b82](https://github.com/trycourier/courier-ruby/commit/0d85b8277f8b92d4f387298a7783cbcbf3c585a2))
* **api:** manual updates ([8d639b8](https://github.com/trycourier/courier-ruby/commit/8d639b8acc654df6242511b035f04d1995298c0b))
* **api:** manual updates ([2af24a7](https://github.com/trycourier/courier-ruby/commit/2af24a7f27da9496ebfb49a35549483bf8560e43))
* **api:** manual updates ([221c2cd](https://github.com/trycourier/courier-ruby/commit/221c2cdeba247e19415c225a58869b0a742e82a1))
* **api:** manual updates ([26c6626](https://github.com/trycourier/courier-ruby/commit/26c66263d5fcd8b10199bffcd4eda41a2b7595ed))
* **api:** manual updates ([97e07ab](https://github.com/trycourier/courier-ruby/commit/97e07ab0a708eaaaf8e413128c09cb634082c141))
* **api:** manual updates ([e8ed384](https://github.com/trycourier/courier-ruby/commit/e8ed384bcf0bc996e047b9489a13e0f3c5d12fb7))
* **api:** manual updates ([e08aa78](https://github.com/trycourier/courier-ruby/commit/e08aa7845992968fcadf24969611c421dd03d81a))
* **api:** manual updates ([06e1d8b](https://github.com/trycourier/courier-ruby/commit/06e1d8b7a7cf573fd5819c17b5d6201a1e408360))
* **api:** manual updates ([8601f07](https://github.com/trycourier/courier-ruby/commit/8601f075e4e693560ab29f4690fea6128425652e))
* **api:** manual updates ([d4899ce](https://github.com/trycourier/courier-ruby/commit/d4899cecd40d44295accc88b24b10ae9fac9d14d))
* **api:** manual updates ([00a8012](https://github.com/trycourier/courier-ruby/commit/00a8012e858163fb45d62e44f657af3bda6550ed))
* **api:** manual updates ([2977a88](https://github.com/trycourier/courier-ruby/commit/2977a881d647d04429db5135adc020cf50e13c27))
* **api:** manual updates ([8a878a0](https://github.com/trycourier/courier-ruby/commit/8a878a0e7ea0b8cce0cd54e37f221ddb5ec204d4))
* **api:** manual updates ([d5cc23f](https://github.com/trycourier/courier-ruby/commit/d5cc23f99b5306e48ef130e144bceb1aa57a7490))
* **api:** manual updates ([1dd87c0](https://github.com/trycourier/courier-ruby/commit/1dd87c099c7df921bc93c36005d8cde767a8687e))
* **api:** manual updates ([9b2b74a](https://github.com/trycourier/courier-ruby/commit/9b2b74a6c40c82333762e187f002bc021942f064))
* **api:** manual updates ([d81fc71](https://github.com/trycourier/courier-ruby/commit/d81fc71f013ad0fb7701b73ca7ed4a9843c812f4))
* **api:** manual updates ([f358b3d](https://github.com/trycourier/courier-ruby/commit/f358b3db2d81dcfd0906f0f66511588766292c12))
* Examples and ref polish ([3987809](https://github.com/trycourier/courier-ruby/commit/3987809dc0da164ca687fc8d6b2870842c0836f4))
* Model sync ([7d005d6](https://github.com/trycourier/courier-ruby/commit/7d005d69c8082e43e28bf04c43455d193c110543))
* Polish and Kick of Java Kit Gen ([2e136c1](https://github.com/trycourier/courier-ruby/commit/2e136c1bd2e9d407d8289a39f5246f7d4c1c9174))
* Template Id ([24598ca](https://github.com/trycourier/courier-ruby/commit/24598cabff382ebc414e8e2f1c815709ebdd7caf))
* Test Github Action ([5b988c5](https://github.com/trycourier/courier-ruby/commit/5b988c5fb80b9684ae6989361952077e90df366b))
* Test stainless open action ([7d264c0](https://github.com/trycourier/courier-ruby/commit/7d264c0652b42286d5b3e9666c00f716e030c451))


### Chores

* configure new SDK language ([29f56f6](https://github.com/trycourier/courier-ruby/commit/29f56f69dd0a1ce4e4e894ae1432bda1da07fea1))
* ignore linter error for tests having large collections ([59d9b7f](https://github.com/trycourier/courier-ruby/commit/59d9b7f9987c061850254e99c3713b2abb39662f))
* update SDK settings ([0f6c8ef](https://github.com/trycourier/courier-ruby/commit/0f6c8ef4fb11a6127a57e16bbd07a547ec458cef))
* update SDK settings ([021c76b](https://github.com/trycourier/courier-ruby/commit/021c76ba9fdedfe90ce34c90889008dff19f9df0))

## 3.4.0-alpha0 (2025-10-10)

Full Changelog: [v0.0.1...v3.4.0-alpha0](https://github.com/trycourier/courier-ruby/compare/v0.0.1...v3.4.0-alpha0)

### Features

* **api:** manual updates ([051c3c4](https://github.com/trycourier/courier-ruby/commit/051c3c4722fa39896d01d0841f4989c91aa75c45))
* **api:** manual updates ([ea5dfb3](https://github.com/trycourier/courier-ruby/commit/ea5dfb319688c23cc97da6a6ad80d4837bae04dd))
* **api:** manual updates ([589a36f](https://github.com/trycourier/courier-ruby/commit/589a36f974d97fa73ecdf9a2a9b335492b15b203))
* **api:** manual updates ([373bfde](https://github.com/trycourier/courier-ruby/commit/373bfde900f61ab7d70dcf775bd6aba16559d4df))
* **api:** manual updates ([7c80f38](https://github.com/trycourier/courier-ruby/commit/7c80f3886fee9dc87253362a3eb51fe73cb44827))
* **api:** manual updates ([f6681a9](https://github.com/trycourier/courier-ruby/commit/f6681a932e946bce954e2636f711694339d80471))
* **api:** manual updates ([6a77929](https://github.com/trycourier/courier-ruby/commit/6a779292f8e2479621698d89a344466d95c97eab))
* **api:** manual updates ([ab9922d](https://github.com/trycourier/courier-ruby/commit/ab9922d111846aebe424749ae0cb9668332e3e62))
* **api:** manual updates ([4de89e5](https://github.com/trycourier/courier-ruby/commit/4de89e5fdad38358f42a1fec4835eda07247b57e))
* **api:** manual updates ([babe4b8](https://github.com/trycourier/courier-ruby/commit/babe4b874fe7a4b5f8b306a5ebce7be0baf877e3))
* **api:** manual updates ([91ad238](https://github.com/trycourier/courier-ruby/commit/91ad2389821d60def82ce67ee5f42f3a7f803f1c))
* **api:** manual updates ([f80182f](https://github.com/trycourier/courier-ruby/commit/f80182f49b5abc44e758579d1ab9b475e1f41c95))
* **api:** manual updates ([0d85b82](https://github.com/trycourier/courier-ruby/commit/0d85b8277f8b92d4f387298a7783cbcbf3c585a2))
* **api:** manual updates ([8d639b8](https://github.com/trycourier/courier-ruby/commit/8d639b8acc654df6242511b035f04d1995298c0b))
* **api:** manual updates ([2af24a7](https://github.com/trycourier/courier-ruby/commit/2af24a7f27da9496ebfb49a35549483bf8560e43))
* **api:** manual updates ([221c2cd](https://github.com/trycourier/courier-ruby/commit/221c2cdeba247e19415c225a58869b0a742e82a1))
* **api:** manual updates ([26c6626](https://github.com/trycourier/courier-ruby/commit/26c66263d5fcd8b10199bffcd4eda41a2b7595ed))
* **api:** manual updates ([97e07ab](https://github.com/trycourier/courier-ruby/commit/97e07ab0a708eaaaf8e413128c09cb634082c141))
* **api:** manual updates ([e8ed384](https://github.com/trycourier/courier-ruby/commit/e8ed384bcf0bc996e047b9489a13e0f3c5d12fb7))
* **api:** manual updates ([e08aa78](https://github.com/trycourier/courier-ruby/commit/e08aa7845992968fcadf24969611c421dd03d81a))
* **api:** manual updates ([06e1d8b](https://github.com/trycourier/courier-ruby/commit/06e1d8b7a7cf573fd5819c17b5d6201a1e408360))
* **api:** manual updates ([8601f07](https://github.com/trycourier/courier-ruby/commit/8601f075e4e693560ab29f4690fea6128425652e))
* **api:** manual updates ([d4899ce](https://github.com/trycourier/courier-ruby/commit/d4899cecd40d44295accc88b24b10ae9fac9d14d))
* **api:** manual updates ([00a8012](https://github.com/trycourier/courier-ruby/commit/00a8012e858163fb45d62e44f657af3bda6550ed))
* **api:** manual updates ([2977a88](https://github.com/trycourier/courier-ruby/commit/2977a881d647d04429db5135adc020cf50e13c27))
* **api:** manual updates ([8a878a0](https://github.com/trycourier/courier-ruby/commit/8a878a0e7ea0b8cce0cd54e37f221ddb5ec204d4))
* **api:** manual updates ([d5cc23f](https://github.com/trycourier/courier-ruby/commit/d5cc23f99b5306e48ef130e144bceb1aa57a7490))
* **api:** manual updates ([1dd87c0](https://github.com/trycourier/courier-ruby/commit/1dd87c099c7df921bc93c36005d8cde767a8687e))
* **api:** manual updates ([9b2b74a](https://github.com/trycourier/courier-ruby/commit/9b2b74a6c40c82333762e187f002bc021942f064))
* **api:** manual updates ([d81fc71](https://github.com/trycourier/courier-ruby/commit/d81fc71f013ad0fb7701b73ca7ed4a9843c812f4))
* **api:** manual updates ([f358b3d](https://github.com/trycourier/courier-ruby/commit/f358b3db2d81dcfd0906f0f66511588766292c12))
* Examples and ref polish ([3987809](https://github.com/trycourier/courier-ruby/commit/3987809dc0da164ca687fc8d6b2870842c0836f4))
* Model sync ([7d005d6](https://github.com/trycourier/courier-ruby/commit/7d005d69c8082e43e28bf04c43455d193c110543))
* Polish and Kick of Java Kit Gen ([2e136c1](https://github.com/trycourier/courier-ruby/commit/2e136c1bd2e9d407d8289a39f5246f7d4c1c9174))
* Template Id ([24598ca](https://github.com/trycourier/courier-ruby/commit/24598cabff382ebc414e8e2f1c815709ebdd7caf))
* Test Github Action ([5b988c5](https://github.com/trycourier/courier-ruby/commit/5b988c5fb80b9684ae6989361952077e90df366b))
* Test stainless open action ([7d264c0](https://github.com/trycourier/courier-ruby/commit/7d264c0652b42286d5b3e9666c00f716e030c451))


### Chores

* configure new SDK language ([29f56f6](https://github.com/trycourier/courier-ruby/commit/29f56f69dd0a1ce4e4e894ae1432bda1da07fea1))
* ignore linter error for tests having large collections ([59d9b7f](https://github.com/trycourier/courier-ruby/commit/59d9b7f9987c061850254e99c3713b2abb39662f))
* update SDK settings ([0f6c8ef](https://github.com/trycourier/courier-ruby/commit/0f6c8ef4fb11a6127a57e16bbd07a547ec458cef))
* update SDK settings ([021c76b](https://github.com/trycourier/courier-ruby/commit/021c76ba9fdedfe90ce34c90889008dff19f9df0))
