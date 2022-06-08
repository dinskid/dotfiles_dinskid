function wrapper(cpcmd)
  vim.cmd('w')
  vim.cmd('lcd %:p:h')
  local file = vim.fn.expand('%')
  vim.cmd('FloatermNew --name=cpterm --wintype=split --position=botright --height=0.4 --silent --autoclose=0')
  local runs = cpcmd .. ' ' .. file .. ' && exit'
  local tosend = {
    'source ~/cp/compile.sh',
    runs,
  }
  for i=1,#tosend do
    vim.cmd(string.format('FloatermSend %s', tosend[i]))
  end
  vim.cmd('FloatermToggle')
end

function prepare()
  wrapper('prep')
end

function compile()
  wrapper('comp')
end

function compileRun()
  wrapper('compr')
end

function compileSubmit()
  wrapper('comps')
end

function compileSubmitRun()
  wrapper('compsr')
end

function onlyRun()
  wrapper('runc')
end

function runcin()
  wrapper('runcin', 'in')
end
