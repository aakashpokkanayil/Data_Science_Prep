
-- in product id 'FUR-TA-10004289' one row profit was null so profit is calculated based on other rows and updated.

select * from cmncmn where Product_ID='FUR-TA-10004289'
select -80.937500 * 6
select -80.937500 * 7
select -80.937500 * 2
---485.625000

--update cmncmn set Profit=485.625000  where Product_ID='FUR-TA-10004289' and Customer_ID='DV-13045' and Profit is null




