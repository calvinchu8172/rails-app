module Select2Helper

  def select2(value, options = {})
    # 1. 根據 index 判斷 select2 association column
    # 2. from 為 field ID 關鍵字
    # 3. 點擊 select2 選單
    # 4. 找到 select2 drop
    # 5. 填入搜尋資料
    # 6. 點擊唯一的選項

    from = options.delete(:from)
    if options[:index].blank?
      select2 = find("span[id=select2-#{from}-container]")
    else
      index = options.delete(:index)
      select2s = all("span[id=select2-#{from}-container]")
      select2 = select2s[index]
    end
    select2.click
    select2_drop = find('.select2-dropdown')
    select2_drop.find('.select2-search input').set(value)
    select2_results = select2_drop.all('li.select2-results__option')
    if select2_results.count > 1
      select2_results.find{ |x| x.text == value }.click
    else
      select2_results.first.click
    end
    wait_for_ajax
  end

  def select2_clear(options = {})
    from = options.delete(:from)
    select2 = if options[:index].blank?
      "$('select[id=#{from}]')"
    else
      "$($('select[id=#{from}]')[#{index}])"
    end
    page.execute_script("#{select2}.val(null).trigger('change');")
  end
end

World Select2Helper
