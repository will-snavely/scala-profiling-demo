import scala.collection.LinearSeq

object TestProgram {
  def myFoldLeft1[A, B](xs: List[A], z: B)(op: (B, A) => B): B = {
    var result = z
    val it = xs.iterator
    while (it.hasNext) {
      result = op(result, it.next())
    }
    result
  }

  def myFoldLeft2[A, B](xs: List[A], z: B)(op: (B, A) => B): B = {
    var acc = z
    var these: LinearSeq[A] = xs
    while (these.nonEmpty) {
      acc = op(acc, these.head)
      these = these.tail
    }
    acc
  }

  def add(a: Int, b: Int): Int = a + b

  def profileMain(input: List[Int]): Any = {
    val left1 = myFoldLeft1(input, 0)(add)
    val left2 = myFoldLeft2(input, 0)(add)
    (left1, left2)
  }

  def main(args: Array[String]): Unit = {
    System.err.println(profileMain(List.range(0, args(0).toInt)))
  }
}
