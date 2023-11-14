/**
 * Welcome to your Workbox-powered service worker!
 *
 * You'll need to register this file in your web app and you should
 * disable HTTP caching for this file too.
 * See https://goo.gl/nhQhGp
 *
 * The rest of the code is auto-generated. Please don't update this file
 * directly; instead, make changes to your Workbox build configuration
 * and re-run your build process.
 * See https://goo.gl/2aRDsh
 */

importScripts("https://storage.googleapis.com/workbox-cdn/releases/4.3.1/workbox-sw.js");

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});

/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [
  {
    "url": "404.html",
    "revision": "89e6d981bc2fc2913f89b8754a4fb8ab"
  },
  {
    "url": "assets/css/0.styles.a04db34c.css",
    "revision": "330e2293c45bb41e03daa63897763457"
  },
  {
    "url": "assets/img/afterDelete.789b3585.png",
    "revision": "789b3585a653d620f769bb0783a627bb"
  },
  {
    "url": "assets/img/afterPut.8de18217.png",
    "revision": "8de1821748f19660467b6c80294c739b"
  },
  {
    "url": "assets/img/beginData.a4ed4ce9.png",
    "revision": "a4ed4ce9d603285ad2b884e6535e04f3"
  },
  {
    "url": "assets/img/delete.3048c139.png",
    "revision": "3048c1391763c720d6cb2845f31c2919"
  },
  {
    "url": "assets/img/getAfterPost.c9f1cc74.png",
    "revision": "c9f1cc745b93bc6ae25cc9b467bd2308"
  },
  {
    "url": "assets/img/getAll.8f931d1c.png",
    "revision": "8f931d1c3f5420db12f4775b14dd2380"
  },
  {
    "url": "assets/img/getById.1b63aa7a.png",
    "revision": "1b63aa7a96ced4521dee9ca32bcdf03f"
  },
  {
    "url": "assets/img/post.b62eaed5.png",
    "revision": "b62eaed58f2813682eaf885539aaec05"
  },
  {
    "url": "assets/img/put.4956f86f.png",
    "revision": "4956f86f7a830a5cdc524c1352bbc42b"
  },
  {
    "url": "assets/img/relationalSchema.3a2a4fde.png",
    "revision": "3a2a4fdeff9e9713d6425c71e25a45b3"
  },
  {
    "url": "assets/img/search.83621669.svg",
    "revision": "83621669651b9a3d4bf64d1a670ad856"
  },
  {
    "url": "assets/js/1.39d55607.js",
    "revision": "23b98ceda5b55e5eb261288331883267"
  },
  {
    "url": "assets/js/10.aa863558.js",
    "revision": "6f71b89832e19a0b648018bc2464ab2f"
  },
  {
    "url": "assets/js/13.69152fc9.js",
    "revision": "649ae8e224325001713624c799ffb15d"
  },
  {
    "url": "assets/js/14.45d86d25.js",
    "revision": "00ba53c49061d163593ec25330721735"
  },
  {
    "url": "assets/js/15.1d118344.js",
    "revision": "13498e0689bf92c21d4238955ff02267"
  },
  {
    "url": "assets/js/16.157e1d3e.js",
    "revision": "b7e0bc365ea787788dc8ede7d543969a"
  },
  {
    "url": "assets/js/17.f9a8f989.js",
    "revision": "66ef442f29725bf8b26a34d5623c7c4e"
  },
  {
    "url": "assets/js/18.17d7d4c7.js",
    "revision": "430d15fe7ba03c487296169708bd2a5d"
  },
  {
    "url": "assets/js/19.cf4c0059.js",
    "revision": "332deb36d930c65089e8f109b440f9fa"
  },
  {
    "url": "assets/js/2.3352db27.js",
    "revision": "e2a91f65914041bec2749be56c80def6"
  },
  {
    "url": "assets/js/20.6cf75c8c.js",
    "revision": "460f8af705b6fad8d02c4e4d051dbd9a"
  },
  {
    "url": "assets/js/21.9840ee13.js",
    "revision": "bed5fe8a4df2df56db0d7718f2f186b2"
  },
  {
    "url": "assets/js/22.04214989.js",
    "revision": "140e2aa3b6d0def0447a4c5b6043278c"
  },
  {
    "url": "assets/js/23.d04f800f.js",
    "revision": "b71cf8d88328fb9d559b08ef10ddee91"
  },
  {
    "url": "assets/js/24.087f3251.js",
    "revision": "727883a6b5966eb62df3f2d2dc3492c2"
  },
  {
    "url": "assets/js/25.acae8e0e.js",
    "revision": "986f4122c36fe9e8fdeafd604b2a20a3"
  },
  {
    "url": "assets/js/26.2ced7144.js",
    "revision": "9c0a5157d4cc30993acc627bcff79c74"
  },
  {
    "url": "assets/js/27.bfff32da.js",
    "revision": "4f4aaae390b50cbae7e7d367568a3684"
  },
  {
    "url": "assets/js/28.9b0b1814.js",
    "revision": "e771e93d6c702b743a58dc8349828272"
  },
  {
    "url": "assets/js/29.0b7ce706.js",
    "revision": "d6a8472b97dd154c225737656a559790"
  },
  {
    "url": "assets/js/3.b08aed10.js",
    "revision": "4cffb535be457b28ccf5bef7686dfbdd"
  },
  {
    "url": "assets/js/30.188b51e0.js",
    "revision": "7e361f590dbdbcd3f5d365fb33cdc8ec"
  },
  {
    "url": "assets/js/31.f27bd216.js",
    "revision": "b3340f7b99a0ba9da5825c7df9d5f914"
  },
  {
    "url": "assets/js/32.d15106ad.js",
    "revision": "d6b050825ed5064ec5a50b76181f8a3d"
  },
  {
    "url": "assets/js/33.e6be9a6f.js",
    "revision": "eedea2f86140d683bba3b289bdc2d2b7"
  },
  {
    "url": "assets/js/34.f94a354a.js",
    "revision": "23f268be5c4f3d7b1aa220427a688a3a"
  },
  {
    "url": "assets/js/35.76fd9de1.js",
    "revision": "b6d21218fb1b60cf4c792e0478d97c30"
  },
  {
    "url": "assets/js/36.e2eb61d4.js",
    "revision": "506083814b7aa1ed815971b71d46eb7a"
  },
  {
    "url": "assets/js/37.f2a51b09.js",
    "revision": "d29ca1ff95c4e0721ebab48e130c4d08"
  },
  {
    "url": "assets/js/38.78c8a44c.js",
    "revision": "65ec5cf71e1d6d6bae4838e9ef12253e"
  },
  {
    "url": "assets/js/39.ba2d158f.js",
    "revision": "49967f676f96d228c50523ee09f39dd5"
  },
  {
    "url": "assets/js/4.445fb3cd.js",
    "revision": "d86b63861cc67841e7b20b8c43099dd2"
  },
  {
    "url": "assets/js/41.c8373cb3.js",
    "revision": "e6b8762a479b414a19fb700261ac7ddc"
  },
  {
    "url": "assets/js/5.981cba08.js",
    "revision": "cc93a5a79530f3fe58a6258299503ca6"
  },
  {
    "url": "assets/js/6.65e8f86b.js",
    "revision": "9e1cfa5e3afde3b233976e8b16bc1bd2"
  },
  {
    "url": "assets/js/7.743b802a.js",
    "revision": "b88f80eba3a8b2b07e5c7e6e1b9b4ecf"
  },
  {
    "url": "assets/js/8.b8a1f499.js",
    "revision": "476c88c081a301cc9debdc1989488fa6"
  },
  {
    "url": "assets/js/9.bacad51b.js",
    "revision": "781f11a8e1de42c858e1806db31cb0fd"
  },
  {
    "url": "assets/js/app.6f4731c2.js",
    "revision": "618bc3df337ed7c46c6660091078cb1a"
  },
  {
    "url": "assets/js/vendors~docsearch.7eb60035.js",
    "revision": "1e191a90655d0d6b862e60709158e047"
  },
  {
    "url": "conclusion/index.html",
    "revision": "003265946eb1d6754d7d05d362327d1a"
  },
  {
    "url": "design/index.html",
    "revision": "8737e6f62674427af95bd6b1a34a1a49"
  },
  {
    "url": "index.html",
    "revision": "d35dd6e221d2c3b0dc223fbb97c29c84"
  },
  {
    "url": "intro/index.html",
    "revision": "11a2a70eb1df3de9d8594bcd6fac7fa6"
  },
  {
    "url": "license.html",
    "revision": "c6ae94487788630ac26fdec72cecb7f2"
  },
  {
    "url": "myAvatar.png",
    "revision": "b76db1e62eb8e7fca02a487eb3eac10c"
  },
  {
    "url": "requirements/index.html",
    "revision": "faaeafb5ea6ea438eaa9eea2c745866e"
  },
  {
    "url": "requirements/stakeholders-needs.html",
    "revision": "251deafcf5594673a2b455f88dba747e"
  },
  {
    "url": "requirements/state-of-the-art.html",
    "revision": "00354f748e4a5ee25c9031ba64b8d368"
  },
  {
    "url": "software/index.html",
    "revision": "bb7ea063979cb4fab13d699ada7c33f5"
  },
  {
    "url": "test/index.html",
    "revision": "6c3b6ecd5235858dc89321e6ee86a5da"
  },
  {
    "url": "use cases/index.html",
    "revision": "23ae19b2074b193526b55a83c94794b8"
  }
].concat(self.__precacheManifest || []);
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});
addEventListener('message', event => {
  const replyPort = event.ports[0]
  const message = event.data
  if (replyPort && message && message.type === 'skip-waiting') {
    event.waitUntil(
      self.skipWaiting().then(
        () => replyPort.postMessage({ error: null }),
        error => replyPort.postMessage({ error })
      )
    )
  }
})
