function showLocation(province , city , town , bank , areacode) {
	
	var loc	= new Location();
	var title	= ['=请选择省份=' , '=请选择城市=' , '=请选择地区=','=请选择银行=','=Select area='];
	$.each(title , function(k , v) {
		title[k]	= '<option value="" selected="selected">'+v+'</option>';
	})
	

	$('#loc_province').append(title[0]);
	$('#loc_city').append(title[1]);
	$('#loc_town').append(title[2]);
	$('#loc_bank').append(title[3]);
	$('#loc_areaCode').append(title[4]);

	$("#loc_province,#loc_city,#loc_town,#loc_bank,#loc_areaCode").select2();

	$('#loc_province').change(function() {

		$('#loc_city').empty();
		$('#loc_city').append(title[1]);
		loc.fillOption('loc_city' , '0,'+$('#loc_province').val());
		$('#loc_city').change()
	})
	
	$('#loc_city').change(function() {
		$('#loc_town').empty();
		$('#loc_town').append(title[2]);
		loc.fillOption('loc_town' , '0,' + $('#loc_province').val() + ',' + $('#loc_city').val());
	})
	
	$('#loc_town').change(function() {
		$('input[@name=location_id]').val($(this).val());
	})
	
	$('#loc_bank').change(function(){
	})
	if (province) {
			loc.fillOption('loc_province' , '0' , province);
			
			if (city) {
				loc.fillOption('loc_city' , '0,'+province , city);
				
				if (town) {
					loc.fillOption('loc_town' , '0,'+province+','+city , town);
				}
			}	
	} else {
//		loc.fillOption('loc_province' , '0');
//		loc.fillOption('loc_bank' , 'bank');
	}
		
}

$(function(){
	showLocation();
	$('#btnval').click(function(){
		alert($('#loc_province').val() + ' - ' + $('#loc_city').val() + ' - ' +  $('#loc_town').val()) 
	})
	$('#btntext').click(function(){
		alert($('#loc_province').select2('data').text + ' - ' + $('#loc_city').select2('data').text + ' - ' +  $('#loc_town').select2('data').text) 
	})
})