# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "171ncfz0ahap2iv55pqq3y1j4w2ind1r8wwiga827r51fzaxngr2";
    x86_64-linux = "07hw7wb1lhjkym2c878fvgxz0k4nf6n05dc348mkd11z9mfjgbk2";
    armv7l-linux = "1ds72d7cb80r1i15rrlgm5glraw71c90ikr6j97w4a8fpsavmzm0";
    aarch64-linux = "1nmnkn28nlb1v2zcysh9g6fhq42bxvx4ppzy105ab9x2ks5hg6kc";
    x86_64-darwin = "1d2kdlzbz59famwhg68sd507f55i5vc9f59cfvvwwrp17jh5r33k";
    aarch64-darwin = "0fnd1wdqzn6bwrky9wvi3j9fjkv1gf531chxl9154niq0490d7x7";
  };

  urlMap = {
    i686-linux = "https://github.com/goreleaser/goreleaser/releases/download/v2.4.7/goreleaser_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/goreleaser/goreleaser/releases/download/v2.4.7/goreleaser_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/goreleaser/goreleaser/releases/download/v2.4.7/goreleaser_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/goreleaser/goreleaser/releases/download/v2.4.7/goreleaser_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/goreleaser/goreleaser/releases/download/v2.4.7/goreleaser_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/goreleaser/goreleaser/releases/download/v2.4.7/goreleaser_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "goreleaser";
  version = "2.4.7";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./goreleaser $out/bin/goreleaser
    installManPage ./manpages/goreleaser.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "Deliver Go binaries as fast and easily as possible";
    homepage = "https://goreleaser.com";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
