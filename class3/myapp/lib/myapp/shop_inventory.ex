defmodule MyApp.ShopInventory do
  use GenServer

  # =====EXERCISE 2=====
  # Client API
  def start_link(shopItems) do
    GenServer.start_link(__MODULE__, shopItems)
  end

  def create_item(pid, item) do
    GenServer.cast(pid, {:create_item, item})
  end

  def list_items(pid) do
    GenServer.cast(pid, (:list_items))
  end

  def delete_item(pid, item) do
    GenServer.cast(pid, {:delete_item, item})
  end

  def get_item_by_name(pid, name) do
    GenServer.call(pid, {:get_item_by_name, name})
  end

  # =====EXERCISE 3=====
  def create_item(item) do
    GenServer.cast(__MODULE__, {:create_item, item})
  end

  def list_items() do
    GenServer.call(__MODULE__, :list_items)
  end

  def delete_item(item) do
    GenServer.cast(__MODULE__, {:delete_item, item})
  end

  def get_item_by_name(name) do
    GenServer.call(__MODULE__, {:get_item_by_name, name})
  end

  # =====EXERCISE 1=====
  # Server API
  @impl true
  def init(shopItems) do
    {:ok, [shopItems]}
  end

  @impl true
  def handle_call(:list_items, _clientPid, state) do
    {:reply, state, state}
  end

  def handle_call({:get_item_by_name, name}, _, state) do
    product = Enum.filter(state, fn product -> product.name == name end)
    result = case product do
      [head | _tail] -> head
      [] -> nil
    end
    {:reply, result, state}
  end

  @impl true
  def handle_cast({:create_item, item}, state) do
    {:noreply, [ item | state ]}
  end

  def handle_cast({:delete_item, item}, state) do
    newState = List.delete(state, item)
    {:noreply, newState}
  end

  # For supervisor testing
  def handle_cast(:crash, _state) do
    throw(:error)
  end
end
