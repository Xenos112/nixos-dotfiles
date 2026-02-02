{
	description = "";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	};

	outputs = { nixpkgs, home-manager,stylix, ...}@inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						users.xenos = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
        stylix.nixosModules.stylix
			];
		};
	};

}
