{
  description = "Simple typst template";

  outputs =
    { ... }:
    {
      templates = {
        default = {
          path = ./template;
        };
      };
    };
}
