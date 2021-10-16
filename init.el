;; Disable package.el
(setq package-enable-at-startup nil)

;; Change the package downloader to straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use-package integration
(straight-use-package 'use-package)

;; Use a package to handle the garbage collector
(straight-use-package '(gcmh-mode :type git :host github :repo "emacsmirror/gcmh"))
;; (setq gcmh-low-cons-threshold 1000000
;;       gcmh-high-cons-threshold #x100000000)
(setq gcmh-idle-delay 0.3)

;; (setq gc-cons-threshold 100000000)
(gcmh-mode 1)

;; Amount of data read by Emacs
(setq read-process-output-max (* 1024 1024 3)) ;; 3 mb

;; Literate config
(setq config-file (concat user-emacs-directory "config.org"))
(org-babel-load-file config-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("55eb59d912b5fdf5c35911b3251146cb8760d5e231f223286b6d98ae5aca4e7a" "af16428da751fc70436d20435568bc7c0319cca9b14075c765a1002e59dbb16c" "c4af08c62cd22877ac4ff81c162543e321c7ffd679d5c36837162f54277bfd01" "c88b95f6df2d22f3de2dc990d33f584ea76c73d49e875a8be7a5cb7218e945f8" "5a84ba6dfd2640d97a09068699e42d6168c706ddd2219ca097bf88916700c9c1" "7850c3b1bb1b19a48a5ff2c37b43a8602aae037bbf37801833c283bc4fae9725" "2b75779a3ffef202319258dae0c9f574a758b5fec432a0f7a1e86208a1850cc0" "01ad7e6118335e92997d3c211ef552915a31691a76822b0216369b515f1286a8" "da54b5d77a89afcf3811f3a6efbb84e13751303c62ee42e702d7a89e6381b3ca" "98f144c703e9dfa51ead033b7996ab3875be10ceb91306d7264fc52c825c70b0" "81243aacfd1a4f1cb945702a3647ab82e66d068042fed5ecf00e1ea6dc7817bb" "7a6ae2561d556f2c7b34765fc6a69b7a8a67e94ac09c7cb23f6935a067f3078a" "fb0c6c89ea2d32f805bbd1969729a681f6c822975a37bde422f714e7b379ba49" "7b8818e114af53445b8459c619626a5e07225d837f90dba28d4c30857c27eb5a" "25a6b3552d84846f13acd469ba84021d38625d944889d9482846115c30d80c4b" "381083b3320cfbeca3cdf7e51872d80d6b197af5bdcd3b6faa0df82ecc5794e0" "5916ead55b37eb831d35ca8b6ce4ea7f2ac3d24433fbbe0fcd773fd2fd99154c" "5c409eaa8bc7d5e6db73e5823f53b938adcc69e05f0030d4c66b279e9f1ab172" "8a8b5d33f635babf3b6b2b951cd7c613dc4888d7490a0ce83a38c76317e058e5" "abd0bb20e3186af2565ba35be4bba735c0b9934579785d603479c377d58753c1" "42468530a04208aea775faa63b6b5e3af32a4451320d89605e7dd66709c4c3c3" "a529daf0affbc50775bfc5ebc583733817ba6f527fa7234c44f6d5441946a8aa" "6bc1249e492d23a5ace110fc8fd729f6e0e6166bbe7301bfc1bc2e30af8fdf2c" "7bb53b5f78c54d916fab08129c521248619b8a7c6744ce80f5fdd95cfe58f3d3" "a5d56b61fc003f08eaf41209e97be5e7f8563cee169cb7b42f30d03ccec80a87" "2524dc4a295fc0f62ad13102f4f09101ff3a421bc04463af1852dd832cd852dc" "924af10064c53df16a6e932cd28e5862024e78c1750f1f620a90856bd651445a" "33d65d7729349f355df95808f85234e413f0a41b0dd11791b65090d0f386db9b" "f1ff28edd0e34ed5a7ea740c2f18f16d2c7fef1b425f1e4c2c677f2316288dea" "67c4e414e7438240273dd4316f85135331fa0576fa4438c8d0399dbd7a88944e" "734a3c0dfdc9196429628f9e68e3c5903e4f7cc5d0289174fcd1a48b3e9e03ce" "b7dc2631c1211f4a0e1f6720f4afc5782f1a6871ff40e965b7ad4f4f43cffd13" "c0b86b7f86db8a23ebba27be633ab29a429bf0c4e98193a903cb2fbd63941fff" "f17012a0838b82489170f1001f8273514965bd5efea1d3b6fe09d686e4725070" "df8f602c81828b67a6628aa9af9b92b1084e1fb2016be5976658508493ed3345" "322d94d9e8c7b2e1cb38e18513d7d8ee3d0aef6c4dd800de3269f918be9c623e" "88db389244fdf5c583ce68e50eff58f3b6b61f8f4ffbf96d90ea0711524bd0b1" "a201483f61d5a0b3eb36774ec84987ffb8ffbcdad19a035c0e9a8cec30696573" "b2cba507a61daaf3faf2bffa16dd9a041c1ac612d157ac118ee35c77984a8370" "f136f15999c580dad53c5c1bf07e977b206cf295d7a950d024612758ce772ad3" "d551edc00e0ed083862fc42814715e5afc7ac5e1d502d0a45bcd29c6a4240b3b" "6a1dd18861bf434e4f7547062abe9991304b68fcf98d11671a1bc105325bb8c7" "f82a845236abf3284a9c270d0a5eb74250f5a8897c4f7b86f79c4da5ad55de13" "bbe8bb5ad68bf230083bba1454516e2eccedd9ab41e471f7b6410a3ecbfc05e9" "cafc355418ba46d74515af761db50d98b3d38ddaf4f700e8ad8168e4750d5cd7" "be4883a98cd0ac64e2bceb55c5350157e56f625d458f3929bab995fcb9738ab5" "e8061b43195fd0d5207a0ad628ce87df59a22271fba2d5b017e1c4fa88839aa8" "4d72a62b2dded915654267aa9f59c80f020cd5d489a92210ddbe4246c4881f6c" "868e612d985bff154abbc0ed34c84aa99512ebeecb22112f65b8d66b7ede0d32" "3236f0b4b3b44f4a8e3866c4e4de513e07ff60e246c92a8e328b6def8ddd4a88" "1bba959a7dc7bfe60840841a19350c6c1c7f60c3b69bfe7421fb151038fc3a88" "4d66d42de47ffbf274579a4d688f2b4c5ce03c2c4f67ef0d1a734a5e529c0168" "9e07529eb504cc940b4dd000388873b5340f16c0514eed03631d811aa162b6cb" "fbd55ab1ad6b468982e0d588544a4a4ca87189371322fff4e7ddf8294527eaf3" "5afc66fe354578425dd378810513526fdeec6dbb6e81d1dba513a8572664db60" "db166ad4f49f73f1c554523ed2c07ec0d62ef8b5e9d4a860bc0c8721ba7cdfce" "1858e5b32cbbbdd1d3a4956440e5d813b66e4c2896761ddf8a7c7140a2eb7779" "6c168e5de3e0bd4c9ff69b4e019df8883485f1a3284c1047d1a0ec73de0bc841" "f35ab6f6a2a708c2cb5bc0862d83e49a3bc40b6fef7416b43537884cc35b7c9b" "b96d9f551080b4f8a6fcd2b4c2ea8a3d11d6884f8be68f5d186eab0943842390" "867d6e4debd631a3200ff14882f4384b68a953e6cdb0f150b28cc92c01fbd1fb" "9855ba0c633720e88302a5f54fd12ef1d955a57ba019a6ac3c3010d553c2f471" "7b6ae5ce0862a155efe229ed989fbe3c14e8ec57ebaea2b2846004f44471cd8b" "dc524f7024ac6bbf9b4f7393b288e27a5c827ebd422ca38cb2baa5d745b82ff8" "6e6e3d237e6ed54662f2ce09d472bb25c54e2edb5b19891341f362a01f696f3b" "181e2a6029aa403f0131f5b85aa5df7c104cfd4e001ad24c483d3976313722d4" "1058139a89603f41bc7d0dcd6e4334ebcfc595187410c93e8dd44925a30d6479" "f60b202359b91843239ac521d634b6526160d6cc3634b17ce9d4f03c876ad888" "54537fe8939dfc8d3a9ab31d17866cd855130b7cfefb458dfb7e9ef73e96067f" "48350ed53a3fb7f846ca001501ec1ea74a5072a1abf45273aeba2aacef5050a8" "2c9d23a30e2744b53b835865ea0b6e0cf15916b1d93e8273eb685246abff20e3" "04c7b60c183bfb78b06a653144eb0cc9ac4c5fa4e12ab86ad1b07b46f8b535c1" "b9e386005e02e0c471099b092595ac3292c26a24f4c98de09d929abbfdb76f37" default))
 '(helm-minibuffer-history-key "M-p")
 '(org-protocol-project-alist
   '(("https://localhost/worg/" :base-url "https://localhost/worg/" :working-directory "d:/orgmode/" :online-suffix ".html" :working-suffix ".org")
     ("My local Org-notes" :working-directory "D:/orgmode/" :working-suffix ".org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
