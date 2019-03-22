module Mutations
  class CreateVoter < BaseMutation

    # Arguments passed to the 'reslove' method
    argument :lVoterUniqueID, Integer, required: false
    argument :sAffNumber, Integer, required: false
    argument :szStateVoterID, Integer, required: false
    argument :sVoterTitle, String, required: false
    argument :szNameLast, String, required: false
    argument :szNameFirst, String, required: false
    argument :szNameMiddle, String, required: false
    argument :sNameSuffix, String, required: false
    argument :sGender, String, required: false
    argument :szSitusAddress, String, required: false
    argument :szSitusCity, String, required: false
    argument :sSitusState, String, required: false
    argument :sSitusZip, Integer, required: false
    argument :sHouseNum, Integer, required: false
    argument :sUnitAbbr, String, required: false
    argument :sUnitNum, Integer, required: false
    argument :szStreetName, String, required: false
    argument :sStreetSuffix, String, required: false
    argument :sPreDir, String, required: false
    argument :sPostDir, String, required: false
    argument :szMailAddress1, String, required: false
    argument :szMailAddress2, String, required: false
    argument :szMailAddress3, String, required: false
    argument :szMailAddress4, String, required: false
    argument :szMailZip, Integer, required: false
    argument :szPhone, String, required: false
    argument :szEmailAddress, String, required: false
    argument :dtBirthDate, String, required: false
    argument :sBirthPlace, String, required: false
    argument :dtRegDate, String, required: false
    argument :dtOrigRegDate, String, required: false
    argument :dtLastUpdate_dt, String, required: false
    argument :sStatusCode, Integer, required: false
    argument :szStatusReasonDesc, String, required: false
    argument :sUserCode1, Integer, required: false
    argument :sUserCode2, Integer, required: false
    argument :iDuplicateIDFlag, String, required: false
    argument :szLanguageName, String, required: false
    argument :szPartyName, String, required: false
    argument :szAVStatusAbbr, String, required: false
    argument :szAVStatusDesc, String, required: false
    argument :szPrecinctName, String, required: false
    argument :sPrecinctID, String, required: false
    argument :sPrecinctPortion, String, required: false
    argument :sDistrictID_0, String, required: false
    argument :iSubDistrict_0, String, required: false
    argument :szDistrictName_0, String, required: false
    argument :sDistrictID_1, String, required: false
    argument :iSubDistrict_1, String, required: false
    argument :szDistrictName_1, String, required: false
    argument :sDistrictID_2, String, required: false
    argument :iSubDistrict_2, String, required: false
    argument :szDistrictName_2, String, required: false
    argument :sDistrictID_3, String, required: false
    argument :iSubDistrict_3, String, required: false
    argument :szDistrictName_3, String, required: false
    argument :sDistrictID_4, String, required: false
    argument :iSubDistrict_4, String, required: false
    argument :szDistrictName_4, String, required: false
    argument :sDistrictID_5, String, required: false
    argument :iSubDistrict_5, String, required: false
    argument :szDistrictName_5, String, required: false

    # Return type from the muation
    type Types::VoterType

    field :voter, Types::VoterType, null: true

    def resolve(
      lVoterUniqueID: nil,
      sAffNumber: nil,
      szStateVoterID: nil,
      sVoterTitle: nil,
      szNameLast: nil,
      szNameFirst: nil,
      szNameMiddle: nil,
      sNameSuffix: nil,
      sGender: nil,
      szSitusAddress: nil,
      szSitusCity: nil,
      sSitusState: nil,
      sSitusZip: nil,
      sHouseNum: nil,
      sUnitAbbr: nil,
      sUnitNum: nil,
      szStreetName: nil,
      sStreetSuffix: nil,
      sPreDir: nil,
      sPostDir: nil,
      szMailAddress1: nil,
      szMailAddress2: nil,
      szMailAddress3: nil,
      szMailAddress4: nil,
      szMailZip: nil,
      szPhone: nil,
      szEmailAddress: nil,
      dtBirthDate: nil,
      sBirthPlace: nil,
      dtRegDate: nil,
      dtOrigRegDate: nil,
      dtLastUpdate_dt: nil,
      sStatusCode: nil,
      szStatusReasonDesc: nil,
      sUserCode1: nil,
      sUserCode2: nil,
      iDuplicateIDFlag: nil,
      szLanguageName: nil,
      szPartyName: nil,
      szAVStatusAbbr: nil,
      szAVStatusDesc: nil,
      szPrecinctName: nil,
      sPrecinctID: nil,
      sPrecinctPortion: nil,
      sDistrictID_0: nil,
      iSubDistrict_0: nil,
      szDistrictName_0: nil,
      sDistrictID_1: nil,
      iSubDistrict_1: nil,
      szDistrictName_1: nil,
      sDistrictID_2: nil,
      iSubDistrict_2: nil,
      szDistrictName_2: nil,
      sDistrictID_3: nil,
      iSubDistrict_3: nil,
      szDistrictName_3: nil,
      sDistrictID_4: nil,
      iSubDistrict_4: nil,
      szDistrictName_4: nil,
      sDistrictID_5: nil,
      iSubDistrict_5: nil,
      szDistrictName_5: nil
    )
      voter = Voter.create(
        lVoterUniqueID: lVoterUniqueID,
        sAffNumber: sAffNumber,
        szStateVoterID: szStateVoterID,
        sVoterTitle: sVoterTitle,
        szNameLast: szNameLast,
        szNameFirst: szNameFirst,
        szNameMiddle: szNameMiddle,
        sNameSuffix: sNameSuffix,
        sGender: sGender,
        szSitusAddress: szSitusAddress,
        szSitusCity: szSitusCity,
        sSitusState: sSitusState,
        sSitusZip: sSitusZip,
        sHouseNum: sHouseNum,
        sUnitAbbr: sUnitAbbr,
        sUnitNum: sUnitNum,
        szStreetName: szStreetName,
        sStreetSuffix: sStreetSuffix,
        sPreDir: sPreDir,
        sPostDir: sPostDir,
        szMailAddress1: szMailAddress1,
        szMailAddress2: szMailAddress2,
        szMailAddress3: szMailAddress3,
        szMailAddress4: szMailAddress4,
        szMailZip: szMailZip,
        szPhone: szPhone,
        szEmailAddress: szEmailAddress,
        sBirthPlace: sBirthPlace,
        dtRegDate: dtRegDate,
        dtOrigRegDate: dtOrigRegDate,
        dtLastUpdate_dt: dtLastUpdate_dt,
        sStatusCode: sStatusCode,
        szStatusReasonDesc: szStatusReasonDesc,
        sUserCode1: sUserCode1,
        sUserCode2: sUserCode2,
        iDuplicateIDFlag: iDuplicateIDFlag,
        szLanguageName: szLanguageName,
        szPartyName: szPartyName,
        szAVStatusAbbr: szAVStatusAbbr,
        szAVStatusDesc: szAVStatusDesc,
        szPrecinctName: szPrecinctName,
        sPrecinctID: sPrecinctID,
        sPrecinctPortion: sPrecinctPortion,
        sDistrictID_0: sDistrictID_0,
        iSubDistrict_0: iSubDistrict_0,
        szDistrictName_0: szDistrictName_0,
        sDistrictID_1: sDistrictID_1,
        iSubDistrict_1: iSubDistrict_1,
        szDistrictName_1: szDistrictName_1,
        sDistrictID_2: sDistrictID_2,
        iSubDistrict_2: iSubDistrict_2,
        szDistrictName_2: szDistrictName_2,
        sDistrictID_3: sDistrictID_3,
        iSubDistrict_3: iSubDistrict_3,
        szDistrictName_3: szDistrictName_3,
        sDistrictID_4: sDistrictID_4,
        iSubDistrict_4: iSubDistrict_4,
        szDistrictName_4: szDistrictName_4,
        sDistrictID_5: sDistrictID_5,
        iSubDistrict_5: iSubDistrict_5,
        szDistrictName_5: szDistrictName_5
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
