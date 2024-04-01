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
    x86_64-linux = "02zga683d319f9b1jnsj4pl66ajl764fdnqijr83n0y69figz3lz";
    aarch64-linux = "03iaqwls2ixnfi6kcn72ypfzz8ghvvnqvqmnqq082cgc9lakmz6c";
    x86_64-darwin = "09lasxpls827p7x3vvhs7r5qhcf11v805fsjnigd8ijj1dfml3m8";
    aarch64-darwin = "0zz6z3m5n08vbgkwvvcr9gvlp0yixb9y7d6k0z6ih2ryapv3xj03";
  };

  urlMap = {
    x86_64-linux = "https://github.com/goreleaser/nfpm/releases/download/v2.36.1/nfpm_2.36.1_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/goreleaser/nfpm/releases/download/v2.36.1/nfpm_2.36.1_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/goreleaser/nfpm/releases/download/v2.36.1/nfpm_2.36.1_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/goreleaser/nfpm/releases/download/v2.36.1/nfpm_2.36.1_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "nfpm";
  version = "2.36.1";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./nfpm $out/bin/nfpm
    installManPage ./manpages/nfpm.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "nFPM is a simple, 0-dependencies, deb, rpm and apk packager.";
    homepage = "https://nfpm.goreleaser.com";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
