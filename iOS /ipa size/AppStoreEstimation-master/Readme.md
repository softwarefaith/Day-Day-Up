App Store IPA estimate
======================

The Apple App Store adds a few MB to an IPA file on submission, when the binary is encrpyted. This script will give you an approximate file size of your app, post-encryption. 

```
    $ estimateipa SomeAppIPA.ipa
    38     total
```

Install
-------

If you want to install this permanently, just `sudo cp estimateipa /usr/local/bin/` (or wherever)!
