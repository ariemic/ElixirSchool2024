defmodule Exercises.Exercise2 do
  @doc """
   Spawn a new process and register it under :hello name
   input: none
   returns: pid
  """
  def create_registered_process() do
    pid = spawn(fn() -> Process.sleep(1000) end)
    Process.register(self(), :hello)
    pid
  end


end
