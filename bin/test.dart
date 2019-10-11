import 'package:test/test.dart';
import 'main.dart';
void main(){

// test to check if the board length is 3X3
  test('BoardSizeTest', (){
    List<List<String>> testBoard = createBoard();
    expect(testBoard.length, 3);
    expect(testBoard[0].length, 3);
    expect(testBoard[1].length, 3);
    expect(testBoard[2].length, 3);
  });
  // test to check if board is empty
  bool allSame(List<String>row,String x)
  {
    return row.every((String item)=>item==x);
  }
  test('checkEmptyBoard', (){
    List<List<String>> testBoard = createBoard();
    expect(allSame(testBoard[0],' '), true);
    expect(allSame(testBoard[1],' '), true);
    expect(allSame(testBoard[2],' '), true);
  });
}