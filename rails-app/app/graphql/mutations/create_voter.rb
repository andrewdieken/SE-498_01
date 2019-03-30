module Mutations
  class CreateVoter < BaseMutation

    # Arguments passed to the 'reslove' method
    argument :s_aff_number, String, required: false
    argument :sz_state_voter_id, String, required: false
    argument :s_voter_title, String, required: false
    argument :sz_name_last, String, required: false
    argument :sz_name_first, String, required: false
    argument :sz_name_middle, String, required: false
    argument :s_name_suffix, String, required: false
    argument :s_gender, String, required: false
    argument :sz_situs_address, String, required: false
    argument :sz_situs_city, String, required: false
    argument :s_situs_state, String, required: false
    argument :s_situs_zip, String, required: false
    argument :s_house_num, String, required: false
    argument :s_unit_abbr, String, required: false
    argument :s_unit_num, String, required: false
    argument :sz_street_name, String, required: false
    argument :s_street_suffix, String, required: false
    argument :s_pre_dir, String, required: false
    argument :s_post_dir, String, required: false
    argument :sz_mail_address_1, String, required: false
    argument :sz_mail_address_2, String, required: false
    argument :sz_mail_address_3, String, required: false
    argument :sz_mail_address_4, String, required: false
    argument :sz_mail_zip, String, required: false
    argument :sz_phone, String, required: false
    argument :sz_email_address, String, required: false
    argument :dt_birth_date, String, required: false
    argument :s_birth_place, String, required: false
    argument :dt_reg_date, String, required: false
    argument :dt_orig_reg_date, String, required: false
    argument :dt_last_update_dt, String, required: false
    argument :s_status_code, String, required: false
    argument :sz_status_reason_desc, String, required: false
    argument :s_user_code_1, String, required: false
    argument :s_user_code_2, String, required: false
    argument :i_duplicate_id_flag, String, required: false
    argument :sz_language_name, String, required: false
    argument :sz_party_name, String, required: false
    argument :sz_av_status_abbr, String, required: false
    argument :sz_av_status_desc, String, required: false
    argument :sz_precinct_name, String, required: false
    argument :s_precinct_id, String, required: false
    argument :s_precinct_portion, String, required: false
    argument :s_district_id_0, String, required: false
    argument :i_sub_district_0, String, required: false
    argument :sz_district_name_0, String, required: false
    argument :s_district_id_1, String, required: false
    argument :i_sub_district_1, String, required: false
    argument :sz_district_name_1, String, required: false
    argument :s_district_id_2, String, required: false
    argument :i_sub_district_2, String, required: false
    argument :sz_district_name_2, String, required: false
    argument :s_district_id_3, String, required: false
    argument :i_sub_district_3, String, required: false
    argument :sz_district_name_3, String, required: false
    argument :s_district_id_4, String, required: false
    argument :i_sub_district_4, String, required: false
    argument :sz_district_name_4, String, required: false
    argument :s_district_id_5, String, required: false
    argument :i_sub_district_5, String, required: false
    argument :sz_district_name_5, String, required: false

    # Return type from the muation
    type Types::VoterType

    field :voter, Types::VoterType, null: true

    def resolve(
      s_aff_number: "null",
      sz_state_voter_id: "null",
      s_voter_title: "null",
      sz_name_last: "null",
      sz_name_first: "null",
      sz_name_middle: "null",
      s_name_suffix: "null",
      s_gender: "null",
      sz_situs_address: "null",
      sz_situs_city: "null",
      s_situs_state: "null",
      s_situs_zip: "null",
      s_house_num: "null",
      s_unit_abbr: "null",
      s_unit_num: "null",
      sz_street_name: "null",
      s_street_suffix: "null",
      s_pre_dir: "null",
      s_post_dir: "null",
      sz_mail_address_1: "null",
      sz_mail_address_2: "null",
      sz_mail_address_3: "null",
      sz_mail_address_4: "null",
      sz_mail_zip: "null",
      sz_phone: "null",
      sz_email_address: "null",
      dt_birth_date: "null",
      s_birth_place: "null",
      dt_reg_date: "null",
      dt_orig_reg_date: "null",
      dt_last_update_dt: "null",
      s_status_code: "null",
      sz_status_reason_desc: "null",
      s_user_code_1: "null",
      s_user_code_2: "null",
      i_duplicate_id_flag: "null",
      sz_language_name: "null",
      sz_party_name: "null",
      sz_av_status_abbr: "null",
      sz_av_status_desc: "null",
      sz_precinct_name: "null",
      s_precinct_id: "null",
      s_precinct_portion: "null",
      s_district_id_0: "null",
      i_sub_district_0: "null",
      sz_district_name_0: "null",
      s_district_id_1: "null",
      i_sub_district_1: "null",
      sz_district_name_1: "null",
      s_district_id_2: "null",
      i_sub_district_2: "null",
      sz_district_name_2: "null",
      s_district_id_3: "null",
      i_sub_district_3: "null",
      sz_district_name_3: "null",
      s_district_id_4: "null",
      i_sub_district_4: "null",
      sz_district_name_4: "null",
      s_district_id_5: "null",
      i_sub_district_5: "null",
      sz_district_name_5: "null"
    )
      voter = Voter.create(
        sAffNumber: s_aff_number,
        szStateVoterID: sz_state_voter_id,
        sVoterTitle: s_voter_title,
        szNameLast: sz_name_last,
        szNameFirst: sz_name_first,
        szNameMiddle: sz_name_middle,
        sNameSuffix: s_name_suffix,
        sGender: s_gender,
        szSitusAddress: sz_situs_address,
        szSitusCity: sz_situs_city,
        sSitusState: s_situs_state,
        sSitusZip: s_situs_zip,
        sHouseNum: s_house_num,
        sUnitAbbr: s_unit_abbr,
        sUnitNum: s_unit_num,
        szStreetName: sz_street_name,
        sStreetSuffix: s_street_suffix,
        sPreDir: s_pre_dir,
        sPostDir: s_post_dir,
        szMailAddress1: sz_mail_address_1,
        szMailAddress2: sz_mail_address_2,
        szMailAddress3: sz_mail_address_3,
        szMailAddress4: sz_mail_address_4,
        szMailZip: sz_mail_zip,
        szPhone: sz_phone,
        szEmailAddress: sz_email_address,
        dtBirthDate: dt_birth_date,
        sBirthPlace: s_birth_place,
        dtRegDate: dt_reg_date,
        dtOrigRegDate: dt_orig_reg_date,
        dtLastUpdate_dt: dt_last_update_dt,
        sStatusCode: s_status_code,
        szStatusReasonDesc: sz_status_reason_desc,
        sUserCode1: s_user_code_1,
        sUserCode2: s_user_code_2,
        iDuplicateIDFlag: i_duplicate_id_flag,
        szLanguageName: sz_language_name,
        szPartyName: sz_party_name,
        szAVStatusAbbr: sz_av_status_abbr,
        szAVStatusDesc: sz_av_status_desc,
        szPrecinctName: sz_precinct_name,
        sPrecinctID: s_precinct_id,
        sPrecinctPortion: s_precinct_portion,
        sDistrictID_0: s_district_id_0,
        iSubDistrict_0: i_sub_district_0,
        szDistrictName_0: sz_district_name_0,
        sDistrictID_1: s_district_id_1,
        iSubDistrict_1: i_sub_district_1,
        szDistrictName_1: sz_district_name_1,
        sDistrictID_2: s_district_id_2,
        iSubDistrict_2: i_sub_district_2,
        szDistrictName_2: sz_district_name_2,
        sDistrictID_3: s_district_id_3,
        iSubDistrict_3: i_sub_district_3,
        szDistrictName_3: sz_district_name_3,
        sDistrictID_4: s_district_id_4,
        iSubDistrict_4: i_sub_district_4,
        szDistrictName_4: sz_district_name_4,
        sDistrictID_5: s_district_id_5,
        iSubDistrict_5: i_sub_district_5,
        szDistrictName_5: sz_district_name_5
      )
      if voter.save
        {
          voter: voter
        }
      else
        {
          voter: nil
        }
      end
    end
  end
end
