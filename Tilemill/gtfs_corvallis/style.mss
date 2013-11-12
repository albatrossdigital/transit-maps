#routes {
   line-color: #0AF;
   line-opacity: 0.5;
   line-width: 2;
}
#routes [zoom>15]{
	line-width: 4;
}

#routes [agency_id="KCM"] {
	line-color: #007A2D
}
#routes [agency_id="ST"] {
	line-color: #0AF;
  	line-opacity: .75;
}
#routes [agency_id="ST"][zoom>12] {
	line-width: 4;
}
#routes [agency_id="KMD"] {
	line-color: #DB960F;
}

#routes [agency_id="EOS"] {
	line-color: #B90017;
}





#stops {
    marker-width:2;
    marker-fill:#fff;
    marker-line-color:#aaa;
    marker-allow-overlap:true;
}
#stops [zoom<12]{
	line-opacity: 0;
 	marker-opacity: 0;
}
#stops [zoom>13]{
	marker-width:6;
}
#stops [zoom>15]{
	marker-width:10;
}