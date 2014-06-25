require 'spec_helper'

describe NationBuilder::Client do

  let(:client) do
    NationBuilder::Client.new('dh',
                              '6e516b5d9a3d21b3cc079bc303c01aae3d59c8d4a7e9e6d2acfc11dada0e054e')
  end

  describe '#endpoints' do

    it 'should contain all defined endpoints' do
      client.endpoints.should eq([:basic_pages, :blogs, :blog_posts,
                                   :calendars, :campaign_data, :contacts,
                                   :contact_types, :donations, :events,
                                   :imports, :lists, :page_attachments,
                                   :people, :people_tags, :sites, :surveys,
                                   :survey_responses, :webhooks])
    end

  end

  describe '#base_url' do

    it 'should contain the nation slug' do
      client.base_url.should eq('https://dh.nationbuilder.com')
    end

  end

  describe '#call' do

    it 'should handle a parametered GET' do
      VCR.use_cassette('parametered_get') do
        client.call(:basic_pages, :index, site_slug: 'dh')
          .should eq({"page"=>1, "total_pages"=>1, "per_page"=>10, "total"=>1, "results"=>[{"slug"=>"about", "path"=>"/about", "status"=>"published", "site_slug"=>"dh", "name"=>"About", "headline"=>"About", "title"=>"About - dh", "excerpt"=>"", "author_id"=>2, "published_at"=>"2013-07-08T11:07:00-07:00", "external_id"=>nil, "tags"=>[], "id"=>1, "content"=>"<div style=\"float: right; margin: 0 0 10px 25px;\"><img class=\"img-circle\" src=\"boats.jpg\" alt=\"\"></div>\r\n<p>This is where you tell everyone what your blog is about. Explain what the intended purpose of your blog is, if there is one. If multiple people will be writing for your blog, you might consider posting photos and bios of the contributors.</p>\r\n<p>Proin libero diam, consequat ut nisl vestibulum, commodo scelerisque lacus. In vehicula, est quis rhoncus tristique, dolor sapien aliquam arcu, ut vulputate quam enim quis augue. Phasellus id nunc vitae lectus dapibus viverra malesuada at nibh. Suspendisse sagittis odio non ipsum feugiat porta.</p>\r\n<p> </p>\r\n<p><strong>To change this content, click \"Edit this page\" in the Supporter Nav on the right,<br>or from your Control Panel navigate to Websites &gt; [about] &gt; Content.</strong></p>"}]})
      end
    end

    it 'should handle a parametered POST' do
      person = {
        "person" => {
          "email" => "bob@example.com",
          "last_name" => "Smith",
          "first_name" => "Bob"
        }
      }

      response = VCR.use_cassette('parametered_post') do
        client.call(:people, :create, person)
      end

      response
        .should eq({"person"=>{"birthdate"=>nil, "city_district"=>nil, "civicrm_id"=>nil, "county_district"=>nil, "county_file_id"=>nil, "created_at"=>"2014-06-25T15:35:22-07:00", "do_not_call"=>false, "do_not_contact"=>false, "dw_id"=>nil, "email"=>"bob@example.com", "email_opt_in"=>true, "employer"=>nil, "external_id"=>nil, "federal_district"=>nil, "fire_district"=>nil, "first_name"=>"Bob", "has_facebook"=>false, "id"=>15, "is_twitter_follower"=>false, "is_volunteer"=>false, "judicial_district"=>nil, "labour_region"=>nil, "last_name"=>"Smith", "linkedin_id"=>nil, "mobile"=>nil, "mobile_opt_in"=>true, "nbec_guid"=>nil, "ngp_id"=>nil, "note"=>nil, "occupation"=>nil, "party"=>nil, "pf_strat_id"=>nil, "phone"=>nil, "precinct_id"=>nil, "primary_address"=>nil, "recruiter_id"=>nil, "rnc_id"=>nil, "rnc_regid"=>nil, "salesforce_id"=>nil, "school_district"=>nil, "school_sub_district"=>nil, "sex"=>nil, "state_file_id"=>nil, "state_lower_district"=>nil, "state_upper_district"=>nil, "support_level"=>nil, "supranational_district"=>nil, "tags"=>[], "twitter_id"=>nil, "twitter_name"=>nil, "updated_at"=>"2014-06-25T15:35:22-07:00", "van_id"=>nil, "village_district"=>nil, "active_customer_expires_at"=>nil, "active_customer_started_at"=>nil, "author"=>nil, "author_id"=>nil, "auto_import_id"=>nil, "availability"=>nil, "banned_at"=>nil, "billing_address"=>nil, "bio"=>nil, "call_status_id"=>nil, "call_status_name"=>nil, "capital_amount_in_cents"=>0, "children_count"=>0, "church"=>nil, "city_sub_district"=>nil, "closed_invoices_amount_in_cents"=>nil, "closed_invoices_count"=>nil, "contact_status_id"=>nil, "contact_status_name"=>nil, "could_vote_status"=>nil, "demo"=>nil, "donations_amount_in_cents"=>0, "donations_amount_this_cycle_in_cents"=>0, "donations_count"=>0, "donations_count_this_cycle"=>0, "donations_pledged_amount_in_cents"=>0, "donations_raised_amount_in_cents"=>0, "donations_raised_amount_this_cycle_in_cents"=>0, "donations_raised_count"=>0, "donations_raised_count_this_cycle"=>0, "donations_to_raise_amount_in_cents"=>0, "email1"=>"bob@example.com", "email1_is_bad"=>false, "email2"=>nil, "email2_is_bad"=>false, "email3"=>nil, "email3_is_bad"=>false, "email4"=>nil, "email4_is_bad"=>false, "ethnicity"=>nil, "facebook_address"=>nil, "facebook_profile_url"=>nil, "facebook_updated_at"=>nil, "facebook_username"=>nil, "fax_number"=>nil, "federal_donotcall"=>false, "first_donated_at"=>nil, "first_fundraised_at"=>nil, "first_invoice_at"=>nil, "first_prospect_at"=>nil, "first_recruited_at"=>nil, "first_supporter_at"=>"2014-06-25T15:35:22-07:00", "first_volunteer_at"=>nil, "full_name"=>"Bob Smith", "home_address"=>nil, "import_id"=>nil, "inferred_party"=>nil, "inferred_support_level"=>nil, "invoice_payments_amount_in_cents"=>0, "invoice_payments_referred_amount_in_cents"=>0, "invoices_amount_in_cents"=>nil, "invoices_count"=>nil, "is_deceased"=>false, "is_donor"=>false, "is_fundraiser"=>false, "is_ignore_donation_limits"=>false, "is_leaderboardable"=>true, "is_mobile_bad"=>false, "is_possible_duplicate"=>false, "is_profile_private"=>false, "is_profile_searchable"=>true, "is_prospect"=>false, "is_supporter"=>true, "is_survey_question_private"=>false, "language"=>nil, "last_call_id"=>nil, "last_contacted_at"=>nil, "last_contacted_by"=>nil, "last_donated_at"=>nil, "last_fundraised_at"=>nil, "last_invoice_at"=>nil, "last_rule_violation_at"=>nil, "legal_name"=>nil, "locale"=>nil, "mailing_address"=>nil, "marital_status"=>nil, "media_market_name"=>nil, "meetup_address"=>nil, "membership_expires_at"=>nil, "membership_level_name"=>nil, "membership_started_at"=>nil, "middle_name"=>nil, "mobile_normalized"=>nil, "nbec_precinct_code"=>nil, "note_updated_at"=>nil, "outstanding_invoices_amount_in_cents"=>nil, "outstanding_invoices_count"=>nil, "overdue_invoices_count"=>0, "page_slug"=>nil, "parent"=>nil, "parent_id"=>nil, "party_member"=>false, "phone_normalized"=>nil, "phone_time"=>nil, "precinct_code"=>nil, "precinct_name"=>nil, "prefix"=>nil, "previous_party"=>nil, "primary_email_id"=>1, "priority_level"=>nil, "priority_level_changed_at"=>nil, "profile_content"=>nil, "profile_content_html"=>nil, "profile_headline"=>nil, "received_capital_amount_in_cents"=>0, "recruiter"=>nil, "recruits_count"=>0, "registered_address"=>nil, "registered_at"=>nil, "religion"=>nil, "rule_violations_count"=>0, "spent_capital_amount_in_cents"=>0, "submitted_address"=>nil, "subnations"=>[], "suffix"=>nil, "support_level_changed_at"=>nil, "support_probability_score"=>nil, "turnout_probability_score"=>nil, "twitter_address"=>nil, "twitter_description"=>nil, "twitter_followers_count"=>nil, "twitter_friends_count"=>nil, "twitter_location"=>nil, "twitter_login"=>nil, "twitter_updated_at"=>nil, "twitter_website"=>nil, "unsubscribed_at"=>nil, "user_submitted_address"=>nil, "username"=>nil, "warnings_count"=>0, "website"=>nil, "work_address"=>nil, "work_phone_number"=>nil}, "precinct"=>nil})
    end

    it 'should handle a parametered PUT' do
      person = {
        id: 15,
        person: {
          first_name: "David"
        }
      }

      response = VCR.use_cassette('parametered_put') do
        client.call(:people, :update, person)
      end

      response
        .should eq({"person"=>{"birthdate"=>nil, "city_district"=>nil, "civicrm_id"=>nil, "county_district"=>nil, "county_file_id"=>nil, "created_at"=>"2014-06-25T15:35:22-07:00", "do_not_call"=>false, "do_not_contact"=>false, "dw_id"=>nil, "email"=>"bob@example.com", "email_opt_in"=>true, "employer"=>nil, "external_id"=>nil, "federal_district"=>nil, "fire_district"=>nil, "first_name"=>"David", "has_facebook"=>false, "id"=>15, "is_twitter_follower"=>false, "is_volunteer"=>false, "judicial_district"=>nil, "labour_region"=>nil, "last_name"=>"Smith", "linkedin_id"=>nil, "mobile"=>nil, "mobile_opt_in"=>true, "nbec_guid"=>nil, "ngp_id"=>nil, "note"=>nil, "occupation"=>nil, "party"=>nil, "pf_strat_id"=>nil, "phone"=>nil, "precinct_id"=>nil, "primary_address"=>nil, "recruiter_id"=>nil, "rnc_id"=>nil, "rnc_regid"=>nil, "salesforce_id"=>nil, "school_district"=>nil, "school_sub_district"=>nil, "sex"=>nil, "state_file_id"=>nil, "state_lower_district"=>nil, "state_upper_district"=>nil, "support_level"=>nil, "supranational_district"=>nil, "tags"=>[], "twitter_id"=>"323013939", "twitter_name"=>"Random EVE Guy", "updated_at"=>"2014-06-25T15:38:50-07:00", "van_id"=>nil, "village_district"=>nil, "active_customer_expires_at"=>nil, "active_customer_started_at"=>nil, "author"=>nil, "author_id"=>nil, "auto_import_id"=>nil, "availability"=>nil, "banned_at"=>nil, "billing_address"=>nil, "bio"=>"", "call_status_id"=>nil, "call_status_name"=>nil, "capital_amount_in_cents"=>500, "children_count"=>0, "church"=>nil, "city_sub_district"=>nil, "closed_invoices_amount_in_cents"=>nil, "closed_invoices_count"=>nil, "contact_status_id"=>nil, "contact_status_name"=>nil, "could_vote_status"=>nil, "demo"=>nil, "donations_amount_in_cents"=>0, "donations_amount_this_cycle_in_cents"=>0, "donations_count"=>0, "donations_count_this_cycle"=>0, "donations_pledged_amount_in_cents"=>0, "donations_raised_amount_in_cents"=>0, "donations_raised_amount_this_cycle_in_cents"=>0, "donations_raised_count"=>0, "donations_raised_count_this_cycle"=>0, "donations_to_raise_amount_in_cents"=>0, "email1"=>"bob@example.com", "email1_is_bad"=>false, "email2"=>nil, "email2_is_bad"=>false, "email3"=>nil, "email3_is_bad"=>false, "email4"=>nil, "email4_is_bad"=>false, "ethnicity"=>nil, "facebook_address"=>nil, "facebook_profile_url"=>nil, "facebook_updated_at"=>nil, "facebook_username"=>nil, "fax_number"=>nil, "federal_donotcall"=>false, "first_donated_at"=>nil, "first_fundraised_at"=>nil, "first_invoice_at"=>nil, "first_prospect_at"=>nil, "first_recruited_at"=>nil, "first_supporter_at"=>"2014-06-25T15:35:22-07:00", "first_volunteer_at"=>nil, "full_name"=>"David Smith", "home_address"=>nil, "import_id"=>nil, "inferred_party"=>nil, "inferred_support_level"=>nil, "invoice_payments_amount_in_cents"=>0, "invoice_payments_referred_amount_in_cents"=>0, "invoices_amount_in_cents"=>nil, "invoices_count"=>nil, "is_deceased"=>false, "is_donor"=>false, "is_fundraiser"=>false, "is_ignore_donation_limits"=>false, "is_leaderboardable"=>true, "is_mobile_bad"=>false, "is_possible_duplicate"=>false, "is_profile_private"=>false, "is_profile_searchable"=>true, "is_prospect"=>false, "is_supporter"=>true, "is_survey_question_private"=>false, "language"=>nil, "last_call_id"=>nil, "last_contacted_at"=>nil, "last_contacted_by"=>nil, "last_donated_at"=>nil, "last_fundraised_at"=>nil, "last_invoice_at"=>nil, "last_rule_violation_at"=>nil, "legal_name"=>nil, "locale"=>nil, "mailing_address"=>nil, "marital_status"=>nil, "media_market_name"=>nil, "meetup_address"=>nil, "membership_expires_at"=>nil, "membership_level_name"=>nil, "membership_started_at"=>nil, "middle_name"=>nil, "mobile_normalized"=>nil, "nbec_precinct_code"=>nil, "note_updated_at"=>nil, "outstanding_invoices_amount_in_cents"=>nil, "outstanding_invoices_count"=>nil, "overdue_invoices_count"=>0, "page_slug"=>nil, "parent"=>nil, "parent_id"=>nil, "party_member"=>false, "phone_normalized"=>nil, "phone_time"=>nil, "precinct_code"=>nil, "precinct_name"=>nil, "prefix"=>nil, "previous_party"=>nil, "primary_email_id"=>1, "priority_level"=>nil, "priority_level_changed_at"=>nil, "profile_content"=>nil, "profile_content_html"=>nil, "profile_headline"=>nil, "received_capital_amount_in_cents"=>500, "recruiter"=>nil, "recruits_count"=>0, "registered_address"=>nil, "registered_at"=>nil, "religion"=>nil, "rule_violations_count"=>0, "spent_capital_amount_in_cents"=>0, "submitted_address"=>nil, "subnations"=>[], "suffix"=>nil, "support_level_changed_at"=>nil, "support_probability_score"=>nil, "turnout_probability_score"=>nil, "twitter_address"=>nil, "twitter_description"=>"", "twitter_followers_count"=>10, "twitter_friends_count"=>21, "twitter_location"=>"", "twitter_login"=>"RandomEVEGuy", "twitter_updated_at"=>nil, "twitter_website"=>nil, "unsubscribed_at"=>nil, "user_submitted_address"=>nil, "username"=>"randomeveguy", "warnings_count"=>0, "website"=>nil, "work_address"=>nil, "work_phone_number"=>nil}, "precinct"=>nil})
    end

    it 'should handle a DELETE' do
      params = {
        id: 15,
      }

      response = VCR.use_cassette('delete') do
        client.call(:people, :destroy, params)
      end

      response.should eq({})
    end

  end

end
