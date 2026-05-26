## rstk__sydefault__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__formula_extid__c (string): This is an internal system field used to define the externalID of a record. which is also an internal system field. Neither is currently displayed on any Rootstock User pages.
- rstk__formula_searchindex__c (string): This is an internal system field used to define the searchindex of a record. which is also an internal system field. Neither is currently displayed on any Rootstock User pages.
- rstk__searchindex__c (string): This is an internal system field not currently displayed on any Rootstock User pages
- rstk__sydefault_abortonerror__c (boolean): When checked, when an error is encountered, the given export process will be aborted.
- rstk__sydefault_addrpolicycust__c (boolean): When checked, address details for RS Customers are maintained on associated SF Account, not on the RS Customer Master record, and only edits to Tax Location, Shipping Zone and Emai...

## rstk__syconfig__c
- rstk__SYCONFIG_ALLOWCONTROLJE__c (boolean): This field overrides the standard validation and allows for Journal Entries to be made to Control Accounts (to be used during initial system setup and loading of balances
- rstk__SYCONFIG_USESYDATA__c (boolean): When checked, the ability to utilize the SYDATA object and related functionality is enabled (including SYDATAT and SYDATAD),
- rstk__externalid__c (string): Not Applicable
- rstk__formula_extid__c (string): Not Applicable
- rstk__formula_searchindex__c (string): Not Applicable
- rstk__searchindex__c (string): Not Applicable

## rstk__socntl__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__formula_searchindex__c (string): This is an internal system field used to define the searchindex of a record. which is also an internal system field. Neither is currently displayed on any Rootstock User pages.
- rstk__searchindex__c (string): This is an internal system field not currently displayed on any Rootstock User pages
- rstk__socntl_ackemailsubject__c (string): When set, the text entered here will appear on the SO Acknowledgement email Subject line. Text is user-defined up to 255 characters.
- rstk__socntl_acktemplovr__c (boolean): When checked, this enables a dropdown in the print process whereby active templates will be displayed and can be selected as alternates to the template defined on SO Control, Produ...
- rstk__socntl_actgracedays__c (double): This value is used as the default when adding Sales Contracts.  If activation does not occur during this "grace period" (defined in "days"), billing will begin after this number of...

## rstk__pocntl__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__formula_searchindex__c (string): This is an internal system field used to define the searchindex of a record, which is also an internal system field. Neither is currently displayed on any Rootstock User pages.
- rstk__pocntl_allowmfrovr__c (boolean): When checked, allows the user to override Approved Manufacturers on the PO Line.
- rstk__pocntl_autonumsyreq__c (boolean): Auto Number Indirect Requisitions.  If selected, order numbers are established using the Order Number Assign program in System Setup.  If not selected, indirect material requisitio...
- rstk__pocntl_bankfeeacct__c (reference): This field carries the Sub-Ledger account which will be used to add Buyer-Paid Bank Fees to Payables Invoices
- rstk__pocntl_clearingacct__c (reference): Used for on-demand export of payables invoices for import to EXO (accounting package).  This is a debit account used as a clearing account for this purpose.

## rstkf__apcntl__c
- rstkf__apcntl_1099nectemplate__c (string): Defines the 1099-NEC template to be defaulted in the 1099 process.
- rstkf__apcntl_1099printpkg__c (picklist): Define the application being used for printing 1099's, if applicable. Current options are┬á  RootForms S-Docs
- rstkf__apcntl_1099template__c (string): Defines the 1099 template to be defaulted in the 1099 process. Additional values can be added to picklist values to select from. Current option = AP1099.
- rstkf__apcntl_apbatchopt__c (boolean): When checked, multiple Payable Transactions can be contained within a session. When unchecked, each Payable Transaction is its own session (one-for-one).
- rstkf__apcntl_apclracct__c (reference): AP Clearing Account used when performing manual AP transactions within the given company.  Dropdown is filtered to only display those GL Accounts where the AP Account Type = Accrue...
- rstkf__apcntl_apexchratevaracct__c (reference): Default AP Exchange Rate Variance Account used when performing applicable manual AP transactions within the given company. Dropdown is filtered to only display those GL Accounts wh...

## rstk__arcntl__c
- No inlineHelpText returned via describe.

## rstk__syordnumassign__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid
- rstk__formula_extid__c (string): This is an internal system field used to define the externalID of a record. which is also an internal system field. Neither is currently displayed on any Rootstock User pages.
- rstk__formula_searchindex__c (string): This is an internal system field used to define the searchindex of a record, which is also an internal system field. Neither is currently displayed on any Rootstock User pages.
- rstk__isinactive__c (boolean): This indicates if this record is active .
- rstk__searchindex__c (string): This is an internal system field not currently displayed on any Rootstock User pages
- rstk__syordnumassign_div__c (reference): This value defines the Division you want to associate with this Order Number Record.

## rstk__csacctcntl__c
- rstk__csacctcntl_backdate__c (date): This is the Date the system will use for backdating.
- rstk__csacctcntl_costchguser__c (reference): This field identifies the user who is authorized to change the Divisional Cost Method
- rstk__csacctcntl_cyclcntdays__c (double): The system uses the number of days to calculate the end date of the Backdate period.  (End date = Backdate date + Number of Days).
- rstk__csacctcntl_cyclcntuserid__c (reference): ID of  the User associated with the transaction to be backdated.  Transactions performed by this User will be backdated if today's date is within the specified range.
- rstk__csacctcntl_div__c (reference): The Division that this record applies to.
- rstk__csacctcntl_invadddateovr__c (boolean): When checked, when doing an Inventory Add in the given Division, a 'Transaction Date' will be displayed on the 'Inventory Add page, defaulted to TODAY. If changed, the 'Accounting ...

## rstk__syusr__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__formula_searchindex__c (string): This is an internal system field used to define the searchindex of a record. which is also an internal system field. Neither is currently displayed on any Rootstock User pages.
- rstk__searchindex__c (string): This is an internal system field not currently displayed on any Rootstock User pages
- rstk__syuser_lastsalesdiv__c (reference): System User Last Sales Division
- rstk__syusr_allowlaborbooking__c (boolean): When checked (default) this allows the Manufacturing User to book Work Order labor.
- rstk__syusr_allowqtybooking__c (boolean): When checked (Default) this allows the Manufacturing User to perform a Work Order quantity booking.

## rstk__wocst__c
- rstk__Base_Qty__c (double): Base work order quantity for variance tracking.  Captured when work order initially moves to Status 5.
- rstk__altextid__c (string): Alternate External ID
- rstk__cp_upd_dmd_qtyreq__c (boolean): While updating a Work OrderÔÇÖs 'Qty Required', if this field is checked, quantity required for components will be updated based on the new Qty. Required for the Work Order. If unc...
- rstk__cp_wocst_disassm_iclocitem_select__c (string): TBD - H
- rstk__custpage_addsrlnums__c (string): TBD - H
- rstk__custpage_wocst_any_cost_txns__c (string): TBD - H

## rstk__woorddmd__c
- rstk__woorddmd_ordno__c (reference): This is the Work Order Number for this Work Order Component
- rstk__Base_Cost__c (double): When workflow is activated, this field captures standard, average, or last average cost of the component item at the time of the workflow trigger.  Cost captured depends on configu...
- rstk__Base_Qty__c (double): When workflow is activated, this field captures initial quantity required on the work order component record for variance comparison. Default value is 0.
- rstk__Base_Set__c (boolean): When workflow is activated, this field captures confirms the base cost and quantity are set for the work order component record.  When check, it will inhibit the workflow from furt...
- rstk__altextid__c (string): Alternate External ID
- rstk__custpage_woorddmd_compqty_qtyper_ui__c (double): Internal Field for processing Qty Per

## rstk__woorddmdcst__c
- rstk__woorddmdcst_woorddmd__c (reference): This is the Work Order Number
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__searchindex__c (string): This is an internal system field not currently displayed on any Rootstock User pages
- rstk__triggeroptions__c (string): This is an internal system field which is not currently displayed on any Rootstock User pages.
- rstk__woorddmdcst_comments__c (textarea): Applicable comments
- rstk__woorddmdcst_compitem__c (reference): The item number of the component issued.

## rstk__sytxncst__c
- rstk__altextid__c (string): Alternate External ID
- rstk__cmpno__c (string): Cost Transaction Component Item Number
- rstk__dept__c (string): Cost Transaction Department
- rstk__div__c (string): Cost Transaction Division
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__formula_extid__c (string): This is an internal system field used to define the externalID of a record. which is also an internal system field. Neither is currently displayed on any Rootstock User pages.

## rstk__pohdr__c
- rstk__Custom_Field1__c (string): This is a custom field
- rstk__altextid__c (string): Not Applicable
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__pohdr_actplacedate__c (date): This is the date that the Purchase Order was ORIGINALLY Submitted to Vendor.
- rstk__pohdr_addrtmp_pomail_addr1__c (string): Typically the street address.
- rstk__pohdr_addrtmp_pomail_addr2__c (string): Typically a suite, unit number or apartment number if applicable

## rstk__poline__c
- rstk__poline_ordno__c (reference): The Purchase Order Number associated with this PO Line.
- rstk__Inspection_emails__c (string): Used on PO Receipt Traveler Template
- rstk__altextid__c (string): This is an Internal ID
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__poline_actvendshipdate__c (date): The date the vendor actually ships the po line.
- rstk__poline_amtcomp__c (double): Total amount received on this PO Line in the specified currency.

## rstk__icitem__c
- rstk__icitem_item__c (reference): Item is the designator for a given part. Can be up to 50 characters.
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__icitem_abc__c (string): Used to define cycle count parameters.  This code can be set manually or by running ABC Reclassification.
- rstk__icitem_abcdate__c (date): Date that the Item was reclassified using the 'Calculate ABC Codes' ┬áfunction.
- rstk__icitem_abcsegmentnum__c (double): TBD - H
- rstk__icitem_allocpol__c (boolean): The dimension Source set on the Company for Purchase Item is controlled here. If checked, the Commodity Code value is used; if unchecked, an override must be set.

## rstk__peitem__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__index_item__c (string): Internal Index
- rstk__inv_attributes__c (string): Not Applicable
- rstk__peitem_activestsdate__c (date): The date when the status is changed to ACTIVE (or date Item created, if initial status is ACTIVE).
- rstk__peitem_descr__c (string): User  defined description. This description is displayed throughout the Rootstock product in combination with the associated Item Number.
- rstk__peitem_disassmind__c (boolean): When checked, this indicates this item is a disassembly item, an item harvested for components

## rstk__soprod__c
- rstk__altextid__c (string): Alternate External ID
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid
- rstk__searchindex__c (string): This is an internal system field not currently displayed on any Rootstock User pages
- rstk__soprod_activeind__c (boolean): When checked, this Product is active and will display in Product dropdowns or auto-complete fields throughout Rootstock, including in RS Quote and Sales Order Entry.
- rstk__soprod_addsfproduct_ui__c (boolean): When Checked, system will add a Sales Force Product
- rstk__soprod_altprice1__c (double): Used to default Alternate Price 1 (or whatever field name is defined for these fields on SO Control > Configurator tab) when creating a Selection Component for use in the Product C...

## rstk__poitem__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__poitem_accrued_landedclracct__c (reference): Enter the Accrued Landed Clearing account to be used for this item.  If left blank, the Accrued Landed Clearing account set on the Division Master will be used.
- rstk__poitem_comcod__c (reference): The PO Commodity Code, or item group defaults, assigned to this Item. The chosen commodity code defaults several fields on the Purchase Item Master.  CC values are denoted by a blu...
- rstk__poitem_desc__c (string): User  defined descriptive name of the item.  Direct items are set from the Engineering Item Master and must be maintained from there.  Indirect and Service Item Descriptions are ma...
- rstk__poitem_dfltpoinvqty__c (double): Not Applicable
- rstk__poitem_dfltpoinvqtyind__c (boolean): Not Applicable

## rstk__icitemlot__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__icitemlot_actucstfrght__c (double): Not Applicable
- rstk__icitemlot_actucstlab__c (double): Not Applicable
- rstk__icitemlot_actucstmtl__c (double): Not Applicable
- rstk__icitemlot_actucstohdfrng__c (double): Not Applicable
- rstk__icitemlot_actucstohdlab__c (double): Not Applicable

## rstk__iclocitem__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__iclocitem_availind__c (boolean): When checkbox is checked, inventory can be picked from this Stock Location for POs, WOs or SOs. When unchecked, this location is not available to be picked from.
- rstk__iclocitem_backflushind__c (boolean): Indicates whether the location is a backflush location. This field is set programmatically when inventory is stocked in a Stock Location where the Stock Loc ID associated with it h...
- rstk__iclocitem_blanktagind__c (boolean): TBD
- rstk__iclocitem_comments__c (textarea): This contains comments entered by user in Location Comments field when doing transactions that put this item into this Inventory Location.
- rstk__iclocitem_count__c (double): Quantity counted.  This number can be set manually or by automation and supports in line editing from a list view.

## rstk__icitemsrl__c
- rstk__externalid__c (string): This is an internal system field defined by the formula_extid field.  Neither the formula_extid, nor the externalid field itself, is currently displayed on any Rootstock User pages...
- rstk__formula_searchindex__c (string): This is an internal system field used to define the searchindex of a record, which is also an internal system field. Neither is currently displayed on any Rootstock User pages.
- rstk__icitemsrl_condcd__c (string): Not Applicable
- rstk__icitemsrl_div__c (reference): Applicable Division
- rstk__icitemsrl_item__c (reference): Inventory Item Number
- rstk__icitemsrl_itemrev__c (reference): Current Item Revision

