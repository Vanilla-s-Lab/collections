{ buildNpmPackage
, nodejs-14_x
, generated

, python3
, pkg-config

, lib

, xorg
, cairo
, libpng
, zlib
, gnome2
, glib
, harfbuzz
, freetype

, libjpeg
}:

with generated."github-doodle";

buildNpmPackage {
  inherit pname version src;

  # npmDepsHash = "sha256-Drz80kRpBTDZyKqNPcP1LI0y3aNtFIsKwp1jDWyA02c=";
  npmDepsHash = "";

  nativeBuildInputs = [ python3 pkg-config ];

  # pkgs/applications/science/math/sage/sage-env.nix
  PKG_CONFIG_PATH = lib.makeSearchPathOutput "dev" "lib/pkgconfig"
    [ xorg.pixman cairo libpng zlib gnome2.pango glib harfbuzz freetype ];

  buildInputs = [ libjpeg cairo ];
  dontNpmBuild = true;

  # npmFlags = [ "--verbose" ];
  # installPhase = ''cp -r node_modules "$nodeModulesPath"'';

  patches = [
    ./patches/npm-6-to-8.patch
    ./patches/use-forked-text2png.patch
  ];
}
