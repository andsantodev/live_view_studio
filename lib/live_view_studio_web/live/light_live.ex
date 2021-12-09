defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  # Estado inicial
  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  # Renderização
  def render(assigns) do
    ~L"""
      <h1>Front Porch Light</h1>
      <div class="meter">
        <span style="width: <%= @brightness %>%">
          <%= @brightness %>%
        </span>
      </div>

      <button phx-click="on">On</button>
      <button phx-click="up">+</button>
      <button phx-click="down">-</button>
      <button phx-click="off">Off</button>
    """
  end

  # Evento On
  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  # Evento Off
  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  # Evento Up
  def handle_event("up", _, socket) do

    # brightness = socket.assigns.brightness + 10
    # socket = assign(socket, :brightness, brightness)

    # simplificado
    socket = update(socket, :brightness, &min(&1 + 10, 100))

    {:noreply, socket}
  end

  # Evento Down
  def handle_event("down", _, socket) do
    # brightness = socket.assigns.brightness - 10
    # socket = assign(socket, :brightness, brightness)

    # simplificado
    socket = update(socket, :brightness, &max(&1 - 10, 0))

    {:noreply, socket}
  end

end
