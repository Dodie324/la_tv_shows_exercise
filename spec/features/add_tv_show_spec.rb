require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do
    visit '/television_shows/new'
    fill_in('title', with: 'Breaking Bad')
    fill_in('network', with: 'AMC')
    fill_in('starting_year', with: '2010')
    fill_in('ending_year', with: '2014')
    select('Drama', from: 'genre')
    fill_in('synopsis', with: 'Teacher becomes a drug dealer to support his family')
    click_button 'Add TV Show'

    expect(page).to have_content("Breaking Bad (AMC)")
  end

  scenario "successfully add a new show without optional information" do
    visit '/television_shows/new'
    fill_in('title', with: 'The Walking Dead')
    fill_in('network', with: 'AMC')
    fill_in('starting_year', with: '2010')
    click_button 'Add TV Show'

    expect(page).to have_content("The Walking Dead (AMC)")
  end

  scenario "fail to add synopsis with more than 5000 characters" do
    visit '/television_shows/new'
    fill_in('title', with: 'Manuelita')
    fill_in('network', with: '13')
    fill_in('starting_year', with: '1989')
    fill_in('synopsis', with: 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque eu aliquam elit. Pellentesque lobortis finibus leo, eget porta erat congue at. Sed risus erat, rhoncus et consectetur non, posuere finibus diam. Quisque tempus, tellus at sagittis mollis, dui urna tincidunt nulla, nec posuere justo velit vitae dolor. In eget tellus id est dapibus bibendum. Suspendisse lacinia lectus eu mi ultrices, vel tristique tortor rutrum. Ut purus ex, malesuada non mauris eu, luctus aliquam nulla. Vestibulum accumsan turpis malesuada finibus consectetur. Vivamus sit amet diam est. Morbi quis condimentum purus. Proin a lacus nisi. Donec aliquet, eros at scelerisque tristique, justo libero tempor nulla, id ornare neque justo non libero. Aliquam varius bibendum risus vitae pulvinar.
Integer pulvinar sem vel libero interdum scelerisque. Mauris tellus nisl, efficitur sit amet iaculis sit amet, vulputate eget erat. Quisque risus augue, eleifend nec augue eget, blandit placerat elit. Ut gravida lacus quam, nec porta tortor convallis sed. Sed eget efficitur est. Pellentesque pretium tempor justo, sit amet condimentum velit. Sed lacus massa, commodo eu turpis at, convallis pretium eros. Vivamus convallis condimentum ligula vel efficitur. Donec venenatis diam leo, ut consectetur metus cursus vitae. Fusce tempus vulputate vestibulum. Duis at augue eu tortor iaculis efficitur. Integer ultricies semper arcu, vitae lobortis ligula gravida at. Aliquam facilisis molestie orci ut ullamcorper. Aliquam volutpat metus ligula, sed laoreet lacus fringilla ac. Donec aliquet nisl sed enim porttitor elementum. Vivamus at elit a nisl interdum venenatis.
Suspendisse eget ante vehicula massa sagittis dictum in sed ante. Suspendisse mollis nisi quis ornare pretium. Donec accumsan volutpat porttitor. Cras iaculis libero eget tortor auctor, at posuere velit scelerisque. Vivamus luctus aliquet quam, ac luctus tellus pellentesque in. Vestibulum ac suscipit quam. Maecenas egestas fermentum lorem vitae vehicula. Vivamus tempus aliquam ex, eget vehicula mi vehicula quis. Praesent eget risus lorem. Vivamus nec felis leo.
In id vehicula turpis, in viverra odio. Quisque ut mi ultricies, sollicitudin neque at, blandit arcu. In sed orci et risus feugiat scelerisque. Donec a purus ut nunc sodales egestas et sed erat. Quisque nibh purus, facilisis non est sed, tempor lacinia turpis. Nunc rutrum est eu ligula tincidunt consectetur. Ut id mi vel tellus fermentum accumsan. Pellentesque vitae augue cursus, accumsan libero at, tincidunt metus.
Vestibulum ultrices rhoncus turpis, in sagittis arcu sodales in. Integer blandit varius lobortis. Integer maximus odio posuere felis sagittis egestas. Maecenas vitae orci tempus, varius lacus id, euismod lorem. Suspendisse pulvinar, tellus ut tincidunt vehicula, libero dui vestibulum orci, id sollicitudin enim erat id odio. Suspendisse potenti. Duis leo sem, varius in maximus ut, porttitor nec nulla. Vestibulum interdum maximus aliquet. Nulla faucibus erat aliquet sem fringilla malesuada. Fusce non sem ante. Aliquam a nisi vel ex aliquet sodales. Nulla pulvinar ut mi in porta. Etiam ac arcu gravida elit rutrum pulvinar sed vitae arcu.
Phasellus varius est at orci gravida dictum. Aliquam sollicitudin ante vel arcu commodo bibendum. Phasellus pulvinar ligula eu arcu ultrices pulvinar. Phasellus egestas finibus quam. Sed tincidunt, lectus at imperdiet lacinia, ex nisi porttitor neque, at congue magna lacus sit amet arcu. Maecenas egestas nisi quis magna malesuada, molestie tincidunt dui volutpat. Sed a euismod tellus, nec accumsan turpis. Nam condimentum commodo varius. Cras rhoncus est vel posuere efficitur. In dapibus malesuada purus, nec sollicitudin dui pellentesque nec. Nulla vitae molestie lorem.
In hac habitasse platea dictumst. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin quis ultrices turpis. Mauris dignissim sem tortor, at tempus justo aliquet vitae. Cras consectetur tincidunt porta. Sed hendrerit interdum fermentum. Mauris ullamcorper, mauris non consectetur scelerisque, enim tellus aliquam tortor, id porttitor risus eros eu felis. Duis vel magna at purus molestie sagittis. Donec et malesuada tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel ipsum venenatis ipsum blandit commodo. Donec blandit, augue a congue cursus, quam mi blandit dui, et sollicitudin urna lectus et nisi. Cras nec est in ante hendrerit tristique.
Sed auctor quis dolor at congue. Aenean ut diam posuere, fringilla purus eget, vulputate leo. Fusce sollicitudin ante in fermentum feugiat. Fusce tincidunt nulla id pharetra aliquet. Ut congue accumsan cursus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut ornare neque nulla, quis dictum risus pharetra ac. Curabitur quis lacinia nisi. Aliquam rhoncus ante vel purus posuere suscipit. Donec venenatis ex et urna maximus, quis pharetra nibh auctor.
Donec in nisi facilisis turpis blandit auctor vitae et est. Maecenas accumsan auctor ipsum sit amet semper. Ut sit amet lectus non ligula blandit lobortis. Sed nec varius dui. Sed in dui vel massa tincidunt pulvinar. Etiam sagittis, diam et ornare aliquam, sem ex maximus purus, eu rhoncus massa tellus quis orci. Nam sodales, tellus eu hendrerit tempor, orci ex ullamcorper nisi, eget egestas quam lorem nec quam. Quisque posuere ex ut tellus suscipit, id pretium odio maximus. Sed fermentum condimentum bibendum. Ut feugiat ante eget quam facilisis imperdiet. Mauris ut vulputate sem. Suspendisse potenti. Donec pharetra est eget quam fermentum fermentum. Mauris blandit ex egestas rhoncus ullamcorper.')
    click_button 'Add TV Show'

    expect(page).to have_content("The synopsis exceeds 5000 characters")
  end

  scenario "fail to add the new show with the required fields empty" do
    visit '/television_shows/new'
    click_button "Add TV Show"

    expect(page).to have_content("Please fill out Title, Network and Starting Year")
  end

  scenario "fail to add new show with invalid starting or ending year" do
    visit '/television_shows/new'
    fill_in('title', with: 'Conan')
    fill_in('network', with: 'NBC')
    fill_in('starting_year', with: '1860')
    fill_in('ending_year', with: '1899')
    click_button "Add TV Show"

    expect(page).to have_content("The starting year and ending year must be greater than 1900.")
  end

    scenario "fail to add new show with invalid ending year" do
    visit '/television_shows/new'
    fill_in('title', with: 'Conan')
    fill_in('network', with: 'NBC')
    fill_in('starting_year', with: '1901')
    fill_in('ending_year', with: '1899')
    click_button "Add TV Show"

    expect(page).to have_content("The starting year and ending year must be greater than 1900.")
  end

   scenario "fail to add new show with invalid starting year" do
    visit '/television_shows/new'
    fill_in('title', with: 'Conan')
    fill_in('network', with: 'NBC')
    fill_in('starting_year', with: '1801')
    fill_in('ending_year', with: '1901')
    click_button "Add TV Show"

    expect(page).to have_content("The starting year and ending year must be greater than 1900.")
  end
end
