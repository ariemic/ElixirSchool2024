defmodule Exercises.Exercise5 do
  @doc """
   Spawn a new process, register it under :hello name, receive :second msg first, send it to :test process,
   and after that receive :first one and send it to :test process too
   input: none
   returns: pid
  """
  def selective_receive() do
  #   f = fn() ->
  #     receive do
  #       :second -> send(:test, :second)
  #     end
  #   pid = spawn(f)
  #   Process.register(pid)


  # end
end
