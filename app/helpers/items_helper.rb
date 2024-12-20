module ItemsHelper
  def complete_button(item)
    button_to toggle_completed_item_url(item), method: :patch, class: 'h-[40px] w-[40px] m-[5px]' do
      if item.completed?
        '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="0.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" /></svg>'.html_safe
      else
        '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="0.5" stroke="currentColor"><circle cx="12" cy="12" r="9" stroke-linecap="round" stroke-linejoin="round" /></svg>'.html_safe
      end
    end
  end

  def toggle_all_icon
    '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-10"><path stroke-linecap="round" stroke-linejoin="round" d="m19.5 8.25-7.5 7.5-7.5-7.5" /></svg>'.html_safe
  end
end
