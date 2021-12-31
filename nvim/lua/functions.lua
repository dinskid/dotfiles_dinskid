function NewFile()
  vim.ui.input({ prompt = 'Enter the file name: ' },
  function (fname)
    print()
    print(fname)
  end
  )
end

-- local create_file(fname) {
--
-- }
