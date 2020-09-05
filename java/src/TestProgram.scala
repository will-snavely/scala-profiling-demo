import scala.collection.LinearSeq

object TestProgram {
  def add(a: Int, b: Int): Int = a + b

  def profileMain(input: LinearSeq[Int]): Any = {
    val left1 = input.foldLeft(0)(add)
    val left2 = input.iterator.foldLeft(0)(add)
    (left1, left2)
  }

  def main(args: Array[String]): Unit = {
    System.err.println(profileMain(LinearSeq.range(0, args(0).toInt)))
  }
}
