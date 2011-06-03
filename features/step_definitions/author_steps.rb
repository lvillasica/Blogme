When /^(?:|I )select date "([^"]*)" from "([^"]*)"$/ do |value, field|
  select_date(field, {:with => value})
end
Given /^these users exist$/ do
  @author1 = Factory.create(:author1)
  Factory.create(:author2)
end
When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept    
end
When /^I didn't confirm popup$/ do
  page.driver.browser.switch_to.alert.dismiss
end
Given /^these articles and users exist$/ do
  Given %{these users exist}
  @article1 = Factory.create(:article1)
end
When /^(?:|I )follow "([^"]*)" then "([^"]*)"$/ do |link1, link2|
  click_link(link1)
  click_link(link2)
end
Given /^this comment exists$/ do
  @comment = Factory.create(:comment1)
end

