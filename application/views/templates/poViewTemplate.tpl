[[if $view_status eq 'Download']]
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<style>
.own-table{
    width: 100%;
}

.own-table th,.own-table td,.own-table {
    border: 1px solid black;
    border-collapse: collapse;
}

.own-td-1{
    padding : 5px 5px 5px 40px;
}

.own-td-2{
    padding: 5px;
    font-size: 10px;
}

.own-td-3{
    padding-bottom: 200px;
}

.own-td-4{
    padding-bottom: 10px;
    font-size: 12px;
}

.own-td-5{
    padding-bottom: 100px;
}
</style>
<body>
[[/if]]
[[if $view_status neq 'Download']]
<hr/>
[[/if]]
<div class="col-lg-12" style="margin-top: 50px;">
	[[if $view_status neq 'Download']]
	<button class="btn btn-primary" style="float: right;margin-bottom: 10px;" onclick="downloadAsPdfPODetails()">Download as PDF</button>
	[[/if]]
	<table class="own-table">
		<tr>
        	<table class="own-table">
        		<tr>
        			<td width="15%" style="padding: 20px 0px 28px 40px;border: 0px;">
        				[[if $view_status neq 'Download']]
        				<img src="assets/img/TMAR LOGO.jpg" width="100" height="100"></img>
        				[[else]]
        				<img src="https://www.fixpocket.com/public_assets/uploads/beats/1496218155Logo_1.png" width="100" height="100"></img>
        				[[/if]]
        			</td>
		         	<td width="45%" style="border: 0px;">
		         		<h4><b>T.M.ABDUL RAHMAN & SONS</b></h4>
						<h6>MANUFACTURES & EXPORTERS OF FINISHED LEATHER & SHOES</h6>
		         	</td>
		         	<td width="40%" style="border: 0px;padding-right: 20px;" align="right">
		         		<h5 style="text-align: justify;margin-left:50px;tet"><b>43J / 45C Ammoor Road,RANIPET - 632-401</br>
	        			Tel : 91-4172-272470,272480</br>
	        			Email : purchaseddept@tmargroup.in </br>
	        			Email : soles@tmargroup.in</b></h5>

	        			<h5 style="text-align: justify;margin-left:50px;"><b>
	        			H.O : 48(Old No.49) Wuthucattan Street,</br>
	        			Periamet,CHENNAI-600 003.INDIA</br>
	        			Tel : 91-44-25612164,25610078</br>
	        			Email : headoffice@tmargroup.in</br>
	        			GSTIN : 33AABFT2029F1Z0</b></h5>
		         	</td>
        		</tr>
        	</table>
        </tr>
        <tr>
        	<table class="own-table">
        		<tr style="font-weight: bold;">
        			<td align="center" class="own-td-1" width="100%">PURCHASE ORDER</td>
        		</tr>
        	</table>
        </tr>
        <tr>
        	<table class="own-table">
        		<tr>
        			<td class="own-td-1" width="40%"><b>To</b></td>
		         	<td class="own-td-1" width="30%"><b>LH.Po.No</b></td>
		         	<td class="own-td-1" width="30%">[[$searchPoData[0].full_po_number]]</td>
        		</tr>
        	</table>
        </tr>
        <tr>
        	<table class="own-table">
        		<tr>
        			<td class="own-td-1" width="40%">[[$searchPoData[0].supplier_name]]</td>
		         	<td class="own-td-1" width="30%"><b>Date</b></td>
		         	<td class="own-td-1" width="30%">[[$searchPoData[0].po_date]]</td>
        		</tr>
        	</table>
        </tr>
        <tr>
        	<table class="own-table">
        		<tr>
        			<td class="own-td-1" width="40%">[[$searchPoData[0].origin]]</td>
		         	<td class="own-td-1" width="30%"><b>Ord Ref</b></td>
		         	<td class="own-td-1" width="30%">[[$searchPoData[0].order_reference]]</td>
        		</tr>
        	</table>
        </tr>
        <tr>
        	<table class="own-table">
        		<tr>
        			<td class="own-td-1" width="40%"><b>GSTIN : </b>[[$searchPoData[0].gst_no]]</td>
		         	<td class="own-td-1" width="30%"><b>Delivery Date</b></td>
		         	<td class="own-td-1" width="30%">[[$searchPoData[0].delivery_date]]</td>
        		</tr>
        	</table>
        </tr>
        <tr>
        	<table class="own-table">
        		[[if $view_status eq 'Download']]
        		<tr style="font-weight: bold;font-size: 10px;">
        		[[else]]
        		<tr style="font-weight: bold;">
        		[[/if]]
        			<td align="center" width="5%">S.No</td>
		         	<td align="center" width="20%">DESCRIPTION</td>
		         	<td align="center" width="10%">HSN Code</td>
		         	<td align="center" width="5%">QTY</td>
		         	<td align="center" width="5%">UOM</td>
		         	<td align="center" width="5%">PRICE</td>
		         	<td align="center" width="10%">DISCOUNT</td>
		         	[[if $searchPoData[0]['state_code'] neq 22]]
		         	<td align="center" width="10%">CGST</td>
		         	<td align="center" width="10%">SGST</td>
		         	[[/if]]
		         	[[if $searchPoData[0]['state_code'] eq 22]]
		         	<td align="center" width="10%" >IGST</td>
		         	[[/if]]
		         	<td align="center" width="10%">TOTAL AMOUNT</td>
		         	[[if $view_status neq 'Download']]
		         	<td align="center" width="10%">Action</td>
		         	[[/if]]
        		</tr>
        	</table>
        </tr>
        [[assign var=GrandTotal value= 0]]
        [[assign var=CGSTTotalValue value=0]]
        [[assign var=IGSTTotalValue value=0]]
        [[assign var=SGSTTotalValue value=0]]
        [[foreach from=$searchPoData key=k item=v]]
        <tr>
        	<table class="own-table">
        		<tr>
        			<td align="center" width="5%"  class="own-td-2">[[$k+1]]</td>
		         	<td align="center" width="20%" class="own-td-2">[[$v.material_name]]</td>
		         	<td align="center" width="10%" class="own-td-2">[[$v.material_hsn_code]]</td>
		         	<td align="center" width="5%"  class="own-td-2">[[$v.qty]]</td>
		         	<td align="center" width="5%" class="own-td-2">[[$v.material_uom]]</td>
		         	<td align="center" width="5%" class="own-td-2">[[$v.price]]</td>

		         	[[assign var=DISCOUNTTotalValue value=[[(($v.discount/100) * $v.price ) * $v.qty]]]]
		         	<td align="center" width="10%" class="own-td-2">
		         		[[$v.discount]]% </br>
		         		[ [[$DISCOUNTTotalValue]] ]
		         	</td>

		         	[[if $searchPoData[0]['state_code'] neq 22]]
			         	[[assign var=CGSTTotalValue value=[[(($v.CGST/100) * $v.price ) * $v.qty]]]]
			         	<td align="center" width="10%" class="own-td-2">
			         		[[$v.CGST]]% 
			         		</br>[ [[$CGSTTotalValue]] ]
			         	</td>

			         	[[assign var=SGSTTotalValue value=[[(($v.SGST/100) * $v.price ) * $v.qty]]]]
			         	<td align="center" width="10%" class="own-td-2">
			         		[[$v.SGST]]% 
			         		</br>[ [[$SGSTTotalValue]] ]
			         	</td>
		         	[[/if]]


		         	[[if $searchPoData[0]['state_code'] eq 22]]
			         	[[assign var=IGSTTotalValue value=[[(($v.IGST/100) * $v.price ) * $v.qty]]]]
			         	<td align="center" width="10%" class="own-td-2">
			         		[[$v.IGST]]% 
			         		</br>[ [[$IGSTTotalValue]] ]
			         	</td>
		         	[[/if]]

		         	[[assign var=totalPriceValue value=[[($v.qty*$v.price) + $IGSTTotalValue + $SGSTTotalValue + $CGSTTotalValue - $DISCOUNTTotalValue]]]]

		         	<td align="center" width="10%" class="own-td-2"><b>[[$totalPriceValue]]</b></td>

		         	
		         	[[$GrandTotal = $GrandTotal + $totalPriceValue]]
		         	[[if $view_status neq 'Download']]
		         	<td align="center" width="10%" class="own-td-2">
		         		<a href="#" onclick='editPoDetails([[$v|@json_encode]])'>
				          <span class="glyphicon glyphicon-edit"></span>
				        </a>
				        <a href="#" onclick='deletePoDetails([[$v|@json_encode]])' style="margin-left: 10px;">
				          <span class="glyphicon glyphicon-trash"></span>
				        </a>
		         	</td>
		         	[[/if]]
        		</tr>
        	</table>
        </tr>
        [[/foreach]]
        <tr>
        	<table class="own-table">
        		<tr>
        			<td align="center" width="5%"  class="own-td-3"></td>
		         	<td align="center" width="20%" class="own-td-3"></td>
		         	<td align="center" width="10%" class="own-td-3"></td>
		         	<td align="center" width="5%"  class="own-td-3"></td>
		         	<td align="center" width="5%" class="own-td-3"></td>
		         	<td align="center" width="5%" class="own-td-3"></td>
		         	[[if $searchPoData[0]['state_code'] neq 22]]
		         	<td align="center" width="10%" class="own-td-3"></td>
		         	<td align="center" width="10%" class="own-td-3"></td>
		         	[[/if]]
		         	[[if $searchPoData[0]['state_code'] eq 22]]
		         	<td align="center" width="10%" class="own-td-3"></td>
		         	[[/if]]
		         	<td align="center" width="10%" class="own-td-3"></td>
		         	<td align="center" width="10%" class="own-td-3"></td>
		         	[[if $view_status neq 'Download']]
		         	<td align="center" width="10%" class="own-td-3"></td>
		         	[[/if]]
        		</tr>
        	</table>
        </tr>
        <tr>
        	<table class="own-table">
        		<tr>
        			<td align="center" width="5%"  class="own-td-2"></td>
		         	<td align="center" width="55%" class="own-td-2" id="numberToWord"></td>
		         	<td align="center" width="25%" class="own-td-2"><b>TOTAL AMOUNT INR</b></td>
		         	<td align="center" width="10%" class="own-td-2" id="GrandTotal"><b>[[$GrandTotal]]</b></td>
        		</tr>
        	</table>
        </tr>
        <tr>
        	<table class="own-table">
        		<tr>
        			<td align="center" width="60%"  class="own-td-4">
        				<h5 style="float: left;margin:20px; "><b>Terms & Condition :</b></h5>
        				</br>
        				<ul style="float: left;margin:10px; text-align: justify;">
        					<li style="font-weight: bold;">Original invoice with 2 duplicate copies should be submitted at the time of delivering the goods.Products HSN code should be mentioned on the invoice.</li>
        					<li style="margin-top: 10px;font-weight: bold;">Please quote our purchase order number on the invoice.</li>
        					<li style="margin-top: 10px;font-weight: bold;">The material will not be allowed inside our premises on non-working hours and holidays.</li>
        					<li style="margin-top: 10px;font-weight: bold;">Replacement of damages and defects required.We reserve the right to cancel the orders which are delayed / defective.Any further claims from our buyer in respect to quality of the materials supplied by you and incidental expenses therefore will be entirely at your cost.</li>
        					<li style="margin-top: 10px;font-weight: bold;">Freight to be paid as agreed between the parties.</li>
        					<li style="margin-top: 10px;font-weight: bold;">Failing to file a tax return on time.We reserved the right to deduct the tax amount from your payment.</li>
        					<li style="margin-top: 10px;font-weight: bold;">The product supplied should meet reach (European) Standards.Non-compliance will result in penalties.</li>
        				</ul>
        			</td>
		         	<td align="center" width="50%"  class="own-td-4">
		         		<h5 style="float: left;margin:10px 0px 0px 20px;"><b>Incharge</b></h5>
		         		<h5 style="float: right;margin:10px 20px 0px 20px;"><b>For T.M.Abdul Rahman & Sons</b></h5>
		         		</br>
		         		</br>
		         		<h5 style="float: left;margin:100px 0px 0px 20px;"><b>Signature</b></h5>
		         		<h5 style="float: right;margin:100px 20px 0px 20px;"><b>Authozised & Signature</b></h5>
		         	</td>
        		</tr>
        	</table>
        </tr>
	</table>
</div>
[[if $view_status eq 'Download']]
<script>
	[[literal]]
	var number = [[/literal]] [[$GrandTotal]]; [[literal]]
	document.getElementById('numberToWord').innerHTML = "<b>Amount In Words : </b> "+number2text(parseInt(number));
    
	function number2text(value) {
	    var fraction = Math.round(frac(value)*100);
	    var f_text  = "";
	    if(fraction > 0) {
	        f_text = "AND "+convert_number(fraction)+" PAISE";
	    }
	    return convert_number(value)+" RUPEE "+f_text+" ONLY";
	}

	function frac(f) {
	    return f % 1;
	}

	function convert_number(number)
	{
	    if ((number < 0) || (number > 999999999)) 
	    { 
	        return "NUMBER OUT OF RANGE!";
	    }
	    var Gn = Math.floor(number / 10000000);  /* Crore */ 
	    number -= Gn * 10000000; 
	    var kn = Math.floor(number / 100000);     /* lakhs */ 
	    number -= kn * 100000; 
	    var Hn = Math.floor(number / 1000);      /* thousand */ 
	    number -= Hn * 1000; 
	    var Dn = Math.floor(number / 100);       /* Tens (deca) */ 
	    number = number % 100;               /* Ones */ 
	    var tn= Math.floor(number / 10); 
	    var one=Math.floor(number % 10); 
	    var res = ""; 

	    if (Gn>0) 
	    { 
	        res += (convert_number(Gn) + " CRORE"); 
	    } 
	    if (kn>0) 
	    { 
	            res += (((res=="") ? "" : " ") + 
	            convert_number(kn) + " LAKH"); 
	    } 
	    if (Hn>0) 
	    { 
	        res += (((res=="") ? "" : " ") +
	            convert_number(Hn) + " THOUSAND"); 
	    } 

	    if (Dn) 
	    { 
	        res += (((res=="") ? "" : " ") + 
	            convert_number(Dn) + " HUNDRED"); 
	    } 


	    var ones = Array("", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX","SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN","FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN","NINETEEN"); 
		var tens = Array("", "", "TWENTY", "THIRTY", "FOURTY", "FIFTY", "SIXTY","SEVENTY", "EIGHTY", "NINETY"); 

	    if (tn>0 || one>0) 
	    { 
	        if (!(res=="")) 
	        { 
	            res += " AND "; 
	        } 
	        if (tn < 2) 
	        { 
	            res += ones[tn * 10 + one]; 
	        } 
	        else 
	        { 

	            res += tens[tn];
	            if (one>0) 
	            { 
	                res += ("-" + ones[one]); 
	            } 
	        } 
	    }

	    if (res=="")
	    { 
	        res = "zero"; 
	    } 
	    return res;
	}
	[[/literal]]
</script>
[[/if]]
</body>
</html>