defmodule PtaWeb.PtaComponents do
  use Phoenix.Component
  import PtaWeb.CoreComponents

  def cell(assigns) do
    ~H"""
    <td class="border"><%= render_slot(assigns.inner_block) %></td>
    """
  end

  def col_header(assigns) do
    ~H"""
    <th class="border">
      <%= render_slot(@inner_block) %>
      <.icon name="hero-chevron-up" class="h-3 w-3" />
      <.icon name="hero-chevron-down" class="h-3 w-3" />
    </th>
    """
  end
end
