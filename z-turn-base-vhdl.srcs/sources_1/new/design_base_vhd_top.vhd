    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    --library UNISIM;
    --use UNISIM.VCOMPONENTS.ALL;
    
    -- Uncomment the following library declaration if using
    -- arithmetic functions with Signed or Unsigned values
    use IEEE.NUMERIC_STD.ALL;
    
    -- Uncomment the following library declaration if instantiating
    -- any Xilinx leaf cells in this code.
    --library UNISIM;
    --use UNISIM.VComponents.all;
    
    entity design_base_vhd_top is
    
     port   ( 
       DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
       DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
       DDR_cas_n : inout STD_LOGIC;
       DDR_ck_n : inout STD_LOGIC;
       DDR_ck_p : inout STD_LOGIC;
       DDR_cke : inout STD_LOGIC;
       DDR_cs_n : inout STD_LOGIC;
       DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
       DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
       DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
       DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
       DDR_odt : inout STD_LOGIC;
       DDR_ras_n : inout STD_LOGIC;
       DDR_reset_n : inout STD_LOGIC;
       DDR_we_n : inout STD_LOGIC;
       FIXED_IO_ddr_vrn : inout STD_LOGIC;
       FIXED_IO_ddr_vrp : inout STD_LOGIC;
       FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
       FIXED_IO_ps_clk : inout STD_LOGIC;
       FIXED_IO_ps_porb : inout STD_LOGIC;
       FIXED_IO_ps_srstb : inout STD_LOGIC;
      
        --   //LCD
     
       LCD_DATA   : out STD_LOGIC_VECTOR ( 15 downto 0 );
       LCD_VSYNC : out STD_LOGIC;
       LCD_HSYNC :  out STD_LOGIC;
       LCD_DE :  out STD_LOGIC;
       LCD_PCLK :  out STD_LOGIC;
           
    
           
           I2S_SCLK  :  out STD_LOGIC;
        I2S_FSYNC_OUT   :  out STD_LOGIC;
         I2S_DOUT :  out STD_LOGIC;
         I2S_FSYNC_IN :  in STD_LOGIC;
        I2S_DIN : in STD_LOGIC;
        
        HDMI_INTn : in STD_LOGIC;
        MEMS_INTn  : in STD_LOGIC;  
        I2C0_SDA   : inout STD_LOGIC;
        I2C0_SCL     : inout STD_LOGIC;
        
       --  //user define io,
       -- /*   
       --    IO_B13_LP,//11:15
       --    IO_B13_LN,
       --    
       --    IO_B13_LP21,
       --    IO_B13_LN21,
       -- */   
      --   IO_B34_LP  : inout STD_LOGIC_VECTOR (5 downto 1 ) ;
      --   IO_B34_LN  : inout STD_LOGIC_VECTOR (5 downto 1 ) ;
      --   IO_B34_LP6  : in STD_LOGIC;
      --   IO_B34_LP8 : in STD_LOGIC;
      --   IO_B34_LN8  : in STD_LOGIC;
      --   IO_B35_LP : in STD_LOGIC;
      --   IO_B35_LN : in STD_LOGIC;
       --  IO_B34_LP11 : in STD_LOGIC; --// PL_iCLK12M,
       --  IO_B34_LN11 : in STD_LOGIC;  
            
      --   SW   : in  STD_LOGIC_VECTOR (3 downto 0 );
       --  BP   :  out STD_LOGIC;
         LEDS   : out STD_LOGIC_VECTOR (2 downto 0 ) 
            
        
        );
    
 

end design_base_vhd_top;

architecture Behavioral of design_base_vhd_top is

component design_base_vhdl_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FCLK_CLK1_50M : out STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
   
    hdmi_clk : out STD_LOGIC;
    hdmi_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    hdmi_de : out STD_LOGIC;
    hdmi_hsync : out STD_LOGIC;
    hdmi_intn : in STD_LOGIC_VECTOR ( 0 to 0 );
    hdmi_vsync : out STD_LOGIC;
    iic_0_scl_io : inout STD_LOGIC;
    iic_0_sda_io : inout STD_LOGIC;
    mems_intn : in STD_LOGIC_VECTOR ( 0 to 0 );
    temp_intn : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component design_base_vhdl_wrapper;



    
signal  FCLK_CLK1_50M :  STD_LOGIC;
    
signal CLK_SIG	: std_logic;

signal COUNTER :STD_LOGIC_VECTOR(7 DOWNTO 0); 

signal CLK_COUNTER : integer:=0;
signal temp : std_logic := '1';


signal led_out : std_logic;

begin




CLK_SIG <= FCLK_CLK1_50M ;


process(CLK_SIG,CLK_COUNTER)
begin
    if(CLK_SIG'event and CLK_SIG='1') then 
	 CLK_COUNTER <= CLK_COUNTER+ 1 ; 
	 
	 --if (CLK_COUNTER = 600) then
        
	   COUNTER <=  std_logic_vector( unsigned(COUNTER) + 1 ); 
     -- end if ;
     if (CLK_COUNTER = 6000000) then
     
       temp <= NOT temp; CLK_COUNTER<=0;
     
     end if;
    end if;
  
end process;
-- LEDS  (0) <=  led_out ;
 

design_base_vhdl_instance :
   component  design_base_vhdl_wrapper
      port map
  (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FCLK_CLK1_50M => FCLK_CLK1_50M,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
        hdmi_clk => LCD_PCLK,
      hdmi_data(15 downto 0) => LCD_DATA(15 downto 0),
      hdmi_de => LCD_DE,
      hdmi_hsync => LCD_HSYNC,
       hdmi_intn(0 ) => HDMI_INTn,
      hdmi_vsync => LCD_VSYNC,
      iic_0_scl_io =>I2C0_SCL ,
      iic_0_sda_io => I2C0_SDA ,
      mems_intn(0) => MEMS_INTn,
      temp_intn(0 ) => MEMS_INTn
  );



  LEDS  (0) <= NOT temp ;
  LEDS  (2) <= NOT temp ;
  LEDS  (1 ) <=  temp  ;
   




        
     
end Behavioral;
