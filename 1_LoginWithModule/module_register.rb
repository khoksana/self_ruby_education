require 'selenium-webdriver'

module ModuleRegistration
  def open_home_page
    @browser.get'http://demo.redmine.org'
  end

  def open_register_page
    @browser.find_element(class: 'register').click
  end
#----------------negative tests----------------------
  def account_registration_negativ_login(name)
    @browser.find_element(id: 'user_login').send_key  ' '
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_mail').send_keys(name+'@qwqwqw.com')
    @browser.find_element(name: 'commit').click
    @browser.find_element(id: 'errorExplanation').displayed?
   end

  def account_registration_negativ_password(name)
    @browser.find_element(id: 'user_login').send_key  name
    @browser.find_element(id: 'user_password').send_keys ' '
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_mail').send_keys(name+'@qwqwqw.com')
    @browser.find_element(name: 'commit').click
    @browser.find_element(id: 'errorExplanation').displayed?
  end

  def account_registration_negativ_mismatch_password(name)
    @browser.find_element(id: 'user_login').send_key  name
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty111'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIq'
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovII'
    @browser.find_element(id: 'user_mail').send_keys(name+'@qwqwqw.com')
    @browser.find_element(name: 'commit').click
    #@browser.find_element(id: 'flash_notice').text == 'Ваша учётная запись активирована. Вы можете войти.'
    @browser.find_element(id: 'errorExplanation').displayed?
  end

  def account_registration_negativ_firstname(name)
    @browser.find_element(id: 'user_login').send_key  name
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys ' '
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovII'
    @browser.find_element(id: 'user_mail').send_keys(name+'@qwqwqw.com')
    @browser.find_element(name: 'commit').click
    #@browser.find_element(id: 'flash_notice').text == 'Ваша учётная запись активирована. Вы можете войти.'
    @browser.find_element(id: 'errorExplanation').displayed?
  end

  def account_registration_negativ_lastname(name)
    @browser.find_element(id: 'user_login').send_key  name
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIq'
    @browser.find_element(id: 'user_lastname').send_keys ' '
    @browser.find_element(id: 'user_mail').send_keys(name+'@qwqwqw.com')
    @browser.find_element(name: 'commit').click
    #@browser.find_element(id: 'flash_notice').text == 'Ваша учётная запись активирована. Вы можете войти.'
    @browser.find_element(id: 'errorExplanation').displayed?
  end

  def account_registration_negativ_email_1(name)
    @browser.find_element(id: 'user_login').send_key  name
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIq'
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovII'
    @browser.find_element(id: 'user_mail').send_keys ' '
    @browser.find_element(name: 'commit').click
    #@browser.find_element(id: 'flash_notice').text == 'Ваша учётная запись активирована. Вы можете войти.'
    @browser.find_element(id: 'errorExplanation').displayed?
  end

  def account_registration_negativ_email_2(name)
    @browser.find_element(id: 'user_login').send_key  name
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIq'
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovII'
    @browser.find_element(id: 'user_mail').send_keys (name+'qwqwqw.com')
    @browser.find_element(name: 'commit').click
    #@browser.find_element(id: 'flash_notice').text == 'Ваша учётная запись активирована. Вы можете войти.'
    @browser.find_element(id: 'errorExplanation').displayed?
  end

# #----------------positive test----------------------

  #--------------------------validation_of_an_existing_user------------------
  def account_registration_positive_login_logout_new_user(name, email)
    @browser.find_element(id: 'user_login').send_key name
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_mail').send_keys (email+'@asd.com')
    @browser.find_element(name: 'commit').click
    @browser.find_element(id: 'flash_notice').displayed?
    sleep 2
    @browser.find_element(class: 'logout').click
    sleep 2
    @browser.find_element(class: 'login').click
    @browser.find_element(id: 'username').send_key name
    @browser.find_element(id: 'password').send_keys 'qwerty'
    @browser.find_element(name: 'login').click
    sleep 5
    @browser.find_element(class: 'logout').click
   end

  def account_registration_negative_validation_of_an_existing_user(name, email)
    @browser.find_element(id: 'user_login').send_key name
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_mail').send_keys (email+'@asd.com')
    @browser.find_element(name: 'commit').click
    @browser.find_element(id: 'flash_notice').displayed?
    sleep 2
    @browser.find_element(class: 'logout').click
    sleep 5
    @browser.find_element(class: 'register').click
    @browser.find_element(id: 'user_login').send_key name
    @browser.find_element(id: 'user_password').send_keys 'qwerty'
    @browser.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
    @browser.find_element(id: 'user_firstname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_lastname').send_keys 'IvanovIIasasa'
    @browser.find_element(id: 'user_mail').send_keys (email+'@asd.com')
    @browser.find_element(name: 'commit').click
    @browser.find_element(id: 'errorExplanation').displayed?
    sleep 5
  end

  def close_test
   @browser.close
  end
 end