require 'selenium-webdriver'
require_relative 'module_register'

include ModuleRegistration
@browser = Selenium::WebDriver.for :firefox

open_home_page
open_register_page
account_registration_negativ_login(name = 6.times.map{Random.rand(5)}.join)

open_home_page
open_register_page
account_registration_negativ_password(name = 6.times.map{Random.rand(5)}.join)

open_home_page
open_register_page
account_registration_negativ_mismatch_password(name = 6.times.map{Random.rand(5)}.join)

open_home_page
open_register_page
account_registration_negativ_firstname(name = 6.times.map{Random.rand(5)}.join)

open_home_page
open_register_page
account_registration_negativ_lastname(name = 6.times.map{Random.rand(5)}.join)

open_home_page
open_register_page
account_registration_negativ_email_1(name = 6.times.map{Random.rand(5)}.join)

open_home_page
open_register_page
account_registration_negativ_email_2(name = 6.times.map{Random.rand(5)}.join)

open_home_page
open_register_page
account_registration_positive_login_logout_new_user(name = 6.times.map{Random.rand(5)}.join, email=8.times.map{Random.rand(5)}.join)

open_home_page
open_register_page
account_registration_negative_validation_of_an_existing_user(name = 6.times.map{Random.rand(5)}.join, email=8.times.map{Random.rand(5)}.join)


close_test


