$LOAD_PATH << '.'
require 'init.rb'

puts MarkI.with_wheel_positions(6).encode('Strong NE Winds!')
puts MarkII.with_wheel_positions(9, 3).encode('The Desert Fox will move 30 tanks to Calais at dawn')
puts MarkIV.with_wheel_positions(4, 7).encode('The white cliffs of Alghero are visible at night')
puts MarkIV.with_wheel_positions(7, 2).decode("WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE\"SOQTNA8A\"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I")
# final challenge.
code = "QT4e8MJYVhkls.27BL9,.MSqYSi'IUpAJKWg9Ul9p4o8oUoGy'ITd4d0AJVsLQp4kKJB2rz4dxfahwUa\"Wa.MS!k4hs2yY3k8ymnla.MOTxJ6wBM7sC0srXmyAAMl9t\"Wk4hs2yYTtH0vwUZp4a\"WhB2u,o6.!8Zt\"Wf,,eh5tk8WXv9UoM99w2Vr4!.xqA,5MSpWl9p4kJ2oUg'6evkEiQhC'd5d4k0qA'24nEqhtAQmy37il9p4o8vdoVr!xWSkEDn?,iZpw24kF\"fhGJZMI8nkI"
clues = ['FURLIN', 'BUNKER']
solution = MarkIV.solve_for(code, clues)
puts solution.wheel_position_combinations.inspect
puts solution.message
# email reply.
code = "1,0yv.lHAol5w03OntLc7GPfF0gy.D3w0HUgkROYenHe'cai!5dyhGLgf?'RNYeavHSq4Pc0oqFvy'htJO'UzDYstTlL7VXz 9ZNXv1rP231lYqdVn1lL7Te5 jH0Hg4k Pdgdzsnyi.ht55Hg4k ZuafHg5uu,jc0sak  YstThHRXz 9ZVn1lL7VUgn5 Nf9ddB3sE5w03L"
MarkIV.permute do |wheel_positions|
  puts MarkIV.with_wheel_positions(*wheel_positions).decode(code)
  puts wheel_positions
  puts
end
