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
      select2 = find("div[id^=s2id][id$=#{from}]")
    else
      index = options.delete(:index)
      select2s = all("div[id^=s2id][id$=#{from}]")
      select2 = select2s[index]
    end
    select2.find('.select2-choice').click
    select2_drop = find('.select2-drop')
    select2_drop.find('.select2-search input').set(value)
    select2_drop.find('li.select2-result-selectable', text: value).click
    wait_for_ajax
  end

  def select2_clear(options = {})
    # 1. 根據 index 判斷 select2 association column
    # 2. from 為 field ID 關鍵字
    # 3. 點擊 select2 clear 按鈕

    from = options.delete(:from)
    if options[:index].blank?
      select2 = find("div[id^=s2id][id$=#{from}]")
    else
      index = options.delete(:index)
      select2s = all("div[id^=s2id][id$=#{from}]")
      select2 = select2s[index]
    end
    select2.find('.select2-search-choice-close').click
  end

  def select2_input(value, options = {})
    from = options.delete(:from)
    if options[:index].blank?
      select2 = find("div[id^=s2id][id$=#{from}]")
    else
      index = options.delete(:index)
      select2s = all("div[id^=s2id][id$=#{from}]")
      select2 = select2s[index]
    end
    select2.click
    select2.find('.select2-input').set(value)
    selections = all('li.select2-result-selectable')
    if selections.length > 1
      selections[1].click
    else
      selections[0].click
    end
  end

  def select2_js(value, options = {})
    from = options.delete(:from)
    js_code = "$('select[id*=#{from}]').val('#{value}').change();"
    page.evaluate_script(js_code)
  end

  def select2_js_clear(options = {})
    from = options.delete(:from)
    js_code = "$('select[id*=#{from}]').val('').change();"
    page.evaluate_script(js_code)
  end
end

World Select2Helper
