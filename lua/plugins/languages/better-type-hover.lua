if true then return {} end;
return {
    "Sebastian-Nielsen/better-type-hover",
    ft = { "typescript", "typescriptreact" }, 
    config = function()
      require("better-type-hover").setup()
    end,
  }