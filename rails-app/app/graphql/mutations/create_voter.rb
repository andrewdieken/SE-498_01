# module Mutations
#   class CreateVoter < BaseMutation
#     argument :lVoterUniqueID, Integer, required: false, hash_key: "lVoterUniqueID"
#     argument :sAffNumber, Integer, required: false, hash_key: "sAffNumber"
#     argument :szStateVoterID, Integer, required: false, hash_key: "szStateVoterID"
#     argument :sVoterTitle, String, required: false, hash_key: "sVoterTitle"
#     argument :szNameLast, String, required: false, hash_key: "szNameLast"
#     argument :szNameFirst, String, required: false, hash_key: "szNameFirst"
#     argument :szNameMiddle, String, required: false, hash_key: "szNameMiddle"
#     argument :sNameSuffix, String, required: false, hash_key: "sNameSuffix"
#     argument :sGender, String, required: false, hash_key: "sGender"
#     argument :szSitusAddress, String, required: false, hash_key: "szSitusAddress"
#     argument :szSitusCity, String, required: false, hash_key: "szSitusCity"
#     argument :sSitusState, String, required: false, hash_key: "sSitusState"
#     argument :sSitusZip, Integer, required: false, hash_key: "sSitusZip"
#     argument :sHouseNum, Integer, required: false, hash_key: "sHouseNum"
#     argument :sUnitAbbr, String, required: false, hash_key: "sUnitAbbr"
#     argument :sUnitNum, Integer, required: false, hash_key: "sUnitNum"
#     argument :szStreetName, String, required: false, hash_key: "szStreetName"
#     argument :sStreetSuffix, String, required: false, hash_key: "sStreetSuffix"
#     argument :sPreDir, String, required: false, hash_key: "sPreDir"
#     argument :sPostDir, String, required: false, hash_key: "sPostDir"
#     argument :szMailAddress1, String, required: false, hash_key: "szMailAddress1"
#     argument :szMailAddress2, String, required: false, hash_key: "szMailAddress2"
#     argument :szMailAddress3, String, required: false, hash_key: "szMailAddress3"
#     argument :szMailAddress4, String, required: false, hash_key: "szMailAddress4"
#     argument :szMailZip, Integer, required: false, hash_key: "szMailZip"
#     argument :szPhone, String, required: false, hash_key: "szPhone"
#     argument :szEmailAddress, String, required: false, hash_key: "szEmailAddress"
#     argument :dtBirthDate, String, required: false, hash_key: "dtBirthDate"
#     argument :sBirthPlace, String, required: false, hash_key: "sBirthPlace"
#     argument :dtRegDate, String, required: false, hash_key: "dtRegDate"
#     argument :dtOrigRegDate, String, required: false, hash_key: "dtOrigRegDate"
#     argument :dtLastUpdate_dt, String, required: false, hash_key: "dtLastUpdate_dt"
#     argument :sStatusCode, Integer, required: false, hash_key: "sStatusCode"
#     argument :szStatusReasonDesc, String, required: false, hash_key: "szStatusReasonDesc"
#     argument :sUserCode1, Integer, required: false, hash_key: "sUserCode1"
#     argument :sUserCode2, Integer, required: false, hash_key: "sUserCode2"
#     argument :iDuplicateIDFlag, String, required: false, hash_key: "iDuplicateIDFlag"
#     argument :szLanguageName, String, required: false, hash_key: "szLanguageName"
#     argument :szPartyName, String, required: false, hash_key: "szPartyName"
#     argument :szAVStatusAbbr, String, required: false, hash_key: "szAVStatusAbbr"
#     argument :szAVStatusDesc, String, required: false, hash_key: "szAVStatusDesc"
#     argument :szPrecinctName, String, required: false, hash_key: "szPrecinctName"
#     argument :sPrecinctID, String, required: false, hash_key: "sPrecinctID"
#     argument :sPrecinctPortion, String, required: false, hash_key: "sPrecinctPortion"
#     argument :sDistrictID_0, String, required: false, hash_key: "sDistrictID_0"
#     argument :iSubDistrict_0, String, required: false, hash_key: "iSubDistrict_0"
#     argument :szDistrictName_0, String, required: false, hash_key: "szDistrictName_0"
#     argument :sDistrictID_1, String, required: false, hash_key: "sDistrictID_1"
#     argument :iSubDistrict_1, String, required: false, hash_key: "iSubDistrict_1"
#     argument :szDistrictName_1, String, required: false, hash_key: "szDistrictName_1"
#     argument :sDistrictID_2, String, required: false, hash_key: "sDistrictID_2"
#     argument :iSubDistrict_2, String, required: false, hash_key: "iSubDistrict_2"
#     argument :szDistrictName_2, String, required: false, hash_key: "szDistrictName_2"
#     argument :sDistrictID_3, String, required: false, hash_key: "sDistrictID_3"
#     argument :iSubDistrict_3, String, required: false, hash_key: "iSubDistrict_3"
#     argument :szDistrictName_3, String, required: false, hash_key: "szDistrictName_3"
#     argument :sDistrictID_4, String, required: false, hash_key: "sDistrictID_4"
#     argument :iSubDistrict_4, String, required: false, hash_key: "iSubDistrict_4"
#     argument :szDistrictName_4, String, required: false, hash_key: "szDistrictName_4"
#     argument :sDistrictID_5, String, required: false, hash_key: "sDistrictID_5"
#     argument :iSubDistrict_5, String, required: false, hash_key: "iSubDistrict_5"
#     argument :szDistrictName_5, String, required: false, hash_key: "szDistrictName_5"
#
#     type Types::VoterType
#
#     def resolve(
#       lVoterUniqueID: nil,
#       sAffNumber: nil,
#       szStateVoterID: nil,
#       sVoterTitle: nil,
#       szNameLast: nil,
#       szNameFirst: nil,
#       szNameMiddle: nil,
#       sNameSuffix: nil,
#       sGender: nil,
#       szSitusAddress: nil,
#       szSitusCity: nil,
#       sSitusState: nil,
#       sSitusZip: nil,
#       sHouseNum: nil,
#       sUnitAbbr: nil,
#       sUnitNum: nil,
#       szStreetName: nil,
#       sStreetSuffix: nil,
#       sPreDir: nil,
#       sPostDir: nil,
#       szMailAddress1: nil,
#       szMailAddress2: nil,
#       szMailAddress3: nil,
#       szMailAddress4: nil,
#       szMailZip: nil,
#       szPhone: nil,
#       szEmailAddress: nil,
#       dtBirthDate: nil,
#       sBirthPlace: nil,
#       dtRegDate: nil,
#       dtOrigRegDate: nil,
#       dtLastUpdate_dt: nil,
#       sStatusCode: nil,
#       szStatusReasonDesc: nil,
#       sUserCode1: nil,
#       sUserCode2: nil,
#       iDuplicateIDFlag: nil,
#       szLanguageName: nil,
#       szPartyName: nil,
#       szAVStatusAbbr: nil,
#       szAVStatusDesc: nil,
#       szPrecinctName: nil,
#       sPrecinctID: nil,
#       sPrecinctPortion: nil,
#       sDistrictID_0: nil,
#       iSubDistrict_0: nil,
#       szDistrictName_0: nil,
#       sDistrictID_1: nil,
#       iSubDistrict_1: nil,
#       szDistrictName_1: nil,
#       sDistrictID_2: nil,
#       iSubDistrict_2: nil,
#       szDistrictName_2: nil,
#       sDistrictID_3: nil,
#       iSubDistrict_3: nil,
#       szDistrictName_3: nil,
#       sDistrictID_4: nil,
#       iSubDistrict_4: nil,
#       szDistrictName_4: nil,
#       sDistrictID_5: nil,
#       iSubDistrict_5: nil,
#       szDistrictName_5: nil,
#     )
#       Voter.create!(
#         lVoterUniqueID: lVoterUniqueID,
#         sAffNumber: sAffNumber,
#         szStateVoterID: szStateVoterID,
#         sVoterTitle: sVoterTitle,
#         szNameLast: szNameLast,
#         szNameFirst: szNameFirst,
#         szNameMiddle: szNameMiddle,
#         sNameSuffix: sNameSuffix,
#         sGender: sGender,
#         szSitusAddress: szSitusAddress,
#         szSitusCity: szSitusCity,
#         sSitusState: sSitusState,
#         sSitusZip: sSitusZip,
#         sHouseNum: sHouseNum,
#         sUnitAbbr: sUnitAbbr,
#         sUnitNum: sUnitNum,
#         szStreetName: szStreetName,
#         sStreetSuffix: sStreetSuffix,
#         sPreDir: sPreDir,
#         sPostDir: sPostDir,
#         szMailAddress1: szMailAddress1,
#         szMailAddress2: szMailAddress2,
#         szMailAddress3: szMailAddress3,
#         szMailAddress4: szMailAddress4,
#         szMailZip: szMailZip,
#         szPhone: szPhone,
#         szEmailAddress: szEmailAddress,
#         dtBirthDate: dtBirthDate,
#         sBirthPlace: sBirthPlace,
#         dtRegDate: dtRegDate,
#         dtOrigRegDate: dtOrigRegDate,
#         dtLastUpdate_dt: dtLastUpdate_dt,
#         sStatusCode: sStatusCode,
#         szStatusReasonDesc: szStatusReasonDesc,
#         sUserCode1: sUserCode1,
#         sUserCode2: sUserCode2,
#         iDuplicateIDFlag: iDuplicateIDFlag,
#         szLanguageName: szLanguageName,
#         szPartyName: szPartyName,
#         szAVStatusAbbr: szAVStatusAbbr,
#         szAVStatusDesc: szAVStatusDesc,
#         szPrecinctName: szPrecinctName,
#         sPrecinctID: sPrecinctID,
#         sPrecinctPortion: sPrecinctPortion,
#         sDistrictID_0: sDistrictID_0,
#         iSubDistrict_0: iSubDistrict_0,
#         szDistrictName_0: szDistrictName_0,
#         sDistrictID_1: sDistrictID_1,
#         iSubDistrict_1: iSubDistrict_1,
#         szDistrictName_1: szDistrictName_1,
#         sDistrictID_2: sDistrictID_2,
#         iSubDistrict_2: iSubDistrict_2,
#         szDistrictName_2: szDistrictName_2,
#         sDistrictID_3: sDistrictID_3,
#         iSubDistrict_3: iSubDistrict_3,
#         szDistrictName_3: szDistrictName_3,
#         sDistrictID_4: sDistrictID_4,
#         iSubDistrict_4: iSubDistrict_4,
#         szDistrictName_4: szDistrictName_4,
#         sDistrictID_5: sDistrictID_5,
#         iSubDistrict_5: iSubDistrict_5,
#         szDistrictName_5: szDistrictName_5
#       )
#     end
#   end
# end
