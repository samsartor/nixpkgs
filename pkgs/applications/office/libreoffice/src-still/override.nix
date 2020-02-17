{ stdenv, ... }:
attrs:
{
  configureFlags = stdenv.lib.lists.remove "--without-export-validation" attrs.configureFlags;
  meta = attrs.meta // { description = "Comprehensive, professional-quality productivity suite (Still/Stable release)"; };
  patches = = attrs.patches ++ [
    # Poppler-0.82 compatibility
    # https://gerrit.libreoffice.org/81545
    (fetchpatch {
      url = "https://github.com/LibreOffice/core/commit/2eadd46ab81058087af95bdfc1fea28fcdb65998.patch";
      sha256 = "1mpipdfxvixjziizbhfbpybpzlg1ijw7s0yqjpmq5d7pf3pvkm4n";
    })
    # Poppler-0.83 compatibility
    # https://gerrit.libreoffice.org/84384
    (fetchpatch {
      url = "https://github.com/LibreOffice/core/commit/9065cd8d9a19864f6b618f2dc10daf577badd9ee.patch";
      sha256 = "0nd0gck8ra3ffw936a7ri0s6a0ii5cyglnhip2prcjh5yf7vw2i2";
    })
  ];
}
