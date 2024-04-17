defmodule Exercises.Exercise3 do
  @doc """
   Spawn a new process, register it under :hello name, wait for :ping message, print it out and terminate.
   input: none
   returns: pid
  """
  def wait_and_print() do
    # pid = spawn(fn () -> receive do :ping -> IO.inspect(:ping) end end)
    # pid = spawn(self())
    # Process.register(pid, :hello)
    # receive do
    #   :ping -> IO.inspect(:ping)
    # end
  end
end
