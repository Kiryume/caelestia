function one_of(...)
  local cwd = vim.fn.getcwd()
  for k, v in pairs(arg) do
    if string.find(cwd, v) then
      return true
    end
  end
  return false
end

return {
  'Civitasv/cmake-tools.nvim',
  config = function()
    local cmake_command = 'cmake'
    local cmake_build_directory = 'build'
    local cwd = vim.fn.getcwd()
    if one_of('replicube3d', 'Craftus-Next') then
      cmake_command = '/opt/devkitpro/portlibs/3ds/bin/arm-none-eabi-cmake'
      cmake_build_directory = 'build/main.debug'
    end
    require('cmake-tools').setup {
      cmake_command = cmake_command,                                    -- CMake command to use
      cmake_build_directory = cmake_build_directory,                    -- Build directory
      cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' }, -- Additional options for CMake generation
      cmake_soft_link_compile_commands = true,                          -- Auto-links the json file to root

      -- Appearance details
      cmake_runner = {
        type = 'terminal', -- Use Neovim's built-in terminal
      },
    }
  end,
}
