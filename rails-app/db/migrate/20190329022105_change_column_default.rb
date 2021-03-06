class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
	change_column_default :voters, :lVoterUniqueID, 'none'
	change_column_default :voters, :sAffNumber, 'none'
	change_column_default :voters, :szStateVoterID, 'none'
	change_column_default :voters, :sVoterTitle, 'none'
	change_column_default :voters, :szNameLast, 'none'
	change_column_default :voters, :szNameFirst, 'none'
	change_column_default :voters, :szNameMiddle, 'none'
	change_column_default :voters, :sNameSuffix, 'none'
	change_column_default :voters, :sGender, 'none'
	change_column_default :voters, :szSitusAddress, 'none'
	change_column_default :voters, :szSitusCity, 'none'
	change_column_default :voters, :sSitusState, 'none'
	change_column_default :voters, :sSitusZip, 'none'
	change_column_default :voters, :sHouseNum, 'none'
	change_column_default :voters, :sUnitAbbr, 'none'
	change_column_default :voters, :sUnitNum, 'none'
	change_column_default :voters, :szStreetName, 'none'
	change_column_default :voters, :sStreetSuffix, 'none'
	change_column_default :voters, :sPreDir, 'none'
	change_column_default :voters, :sPostDir, 'none'
	change_column_default :voters, :szMailAddress1, 'none'
	change_column_default :voters, :szMailAddress2, 'none'
	change_column_default :voters, :szMailAddress3, 'none'
	change_column_default :voters, :szMailAddress4, 'none'
	change_column_default :voters, :szMailZip, 'none'
	change_column_default :voters, :szPhone, 'none'
	change_column_default :voters, :szEmailAddress, 'none'
	change_column_default :voters, :dtBirthDate, 'none'
	change_column_default :voters, :sBirthPlace, 'none'
	change_column_default :voters, :dtRegDate, 'none'
	change_column_default :voters, :dtOrigRegDate, 'none'
	change_column_default :voters, :dtLastUpdate_dt, 'none'
	change_column_default :voters, :sStatusCode, 'none'
	change_column_default :voters, :szStatusReasonDesc, 'none'
	change_column_default :voters, :sUserCode1, 'none'
	change_column_default :voters, :sUserCode2, 'none'
	change_column_default :voters, :iDuplicateIDFlag, 'none'
	change_column_default :voters, :szLanguageName, 'none'
	change_column_default :voters, :szPartyName, 'none'
	change_column_default :voters, :szAVStatusAbbr, 'none'
	change_column_default :voters, :szAVStatusDesc, 'none'
	change_column_default :voters, :szPrecinctName, 'none'
	change_column_default :voters, :sPrecinctID, 'none'
	change_column_default :voters, :sPrecinctPortion, 'none'
	change_column_default :voters, :sDistrictID_0, 'none'
	change_column_default :voters, :iSubDistrict_0, 'none'
	change_column_default :voters, :szDistrictName_0, 'none'
	change_column_default :voters, :sDistrictID_1, 'none'
	change_column_default :voters, :iSubDistrict_1, 'none'
	change_column_default :voters, :szDistrictName_1, 'none'
	change_column_default :voters, :sDistrictID_2, 'none'
	change_column_default :voters, :iSubDistrict_2, 'none'
	change_column_default :voters, :szDistrictName_2, 'none'
	change_column_default :voters, :sDistrictID_3, 'none'
	change_column_default :voters, :iSubDistrict_3, 'none'
	change_column_default :voters, :szDistrictName_3, 'none'
	change_column_default :voters, :sDistrictID_4, 'none'
	change_column_default :voters, :iSubDistrict_4, 'none'
	change_column_default :voters, :szDistrictName_4, 'none'
	change_column_default :voters, :sDistrictID_5, 'none'
	change_column_default :voters, :iSubDistrict_5, 'none'
	change_column_default :voters, :szDistrictName_5, 'none'
  end
end
