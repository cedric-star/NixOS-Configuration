{
  description = "mynixflake";

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://cache.nixos.org"
      "https://attic.xuyh0120.win/lantian"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-v5.url = "github:noctalia-dev/noctalia";

    myvim.url = "github:cedric-star/MyVim";

    ap-visual-sorting = {
      url = "github:cedric-star/ap-visual-sorting";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen.url = "github:InioX/Matugen";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      # Overlay: stellt pkgs.stable.* aus dem stable-Branch bereit
      stableOverlay = final: prev: {
        pkgsStable = import inputs.nixpkgs-stable {
          inherit (prev.stdenv.hostPlatform) system;
          config.allowUnfree = true;
        };
      };

      # Kernel-Modul: gemeinsam für beide Hosts
      kernelModule =
        { pkgs, ... }:
        {
          nixpkgs.overlays = [
            inputs.nix-cachyos-kernel.overlays.pinned
            inputs.millennium.overlays.default
            stableOverlay
          ];
          boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
        };

      visualSortingModule = {
        environment.systemPackages = [
          inputs.ap-visual-sorting.packages.x86_64-linux.default
        ];
      };

      homeManagerModule = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.cedric = import ./modules/home;
        home-manager.backupFileExtension = "backup";
        home-manager.extraSpecialArgs = { inherit inputs; };
        home-manager.sharedModules = [ inputs.myvim.homeManagerModules.default ];
      };

      commonModules = [
        kernelModule
        visualSortingModule
        home-manager.nixosModules.default
        homeManagerModule
        inputs.stylix.nixosModules.stylix
        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];

      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/${hostname}/configuration.nix ] ++ commonModules;
        };
    in
    {
      nixosConfigurations.my-tower = mkHost "my-tower";
      nixosConfigurations.hp-buch = mkHost "hp-buch";
    };
}