active_buttons = 3;
button_codes = 1,2,3;	
target_button_codes = 11,12,13;
begin;

begin_pcl;

int x;
int total;
array <int> randomarray[0];



loop int b=1 until b>19 begin
	x = random(30000, 60000);
	randomarray.add(x);
	term.print(randomarray[b]);
	term.print("\t");
	total = total+x;
	b = b+1;
end;

randomarray.add(900000-total);
term.print(total);

