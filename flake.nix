{
  description = "Simple typst template";

  outputs = {...}: {
    templates = {
      default = {
        path = ./template;
        description = "Simple typst template";
      };
    };
  };
}
