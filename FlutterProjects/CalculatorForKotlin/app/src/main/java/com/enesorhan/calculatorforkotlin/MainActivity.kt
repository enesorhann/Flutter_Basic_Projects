package com.enesorhan.calculatorforkotlin
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.enesorhan.calculatorforkotlin.databinding.ActivityMainBinding


class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)

        binding.button.setOnClickListener{
            val num1 = binding.editText.text.toString().toDoubleOrNull()
            val num2 = binding.editText2.text.toString().toDoubleOrNull()

            if(num1 != null && num2 != null){
                val result = num1 + num2
                binding.textView.text = "${result}"
            }else{
                binding.textView.text = "Enter Number!"
            }

        }
        binding.button2.setOnClickListener{
            val num1 = binding.editText.text.toString().toDoubleOrNull()
            val num2 = binding.editText2.text.toString().toDoubleOrNull()

            if(num1 != null && num2 != null){
                val result = num1 - num2
                binding.textView.text = "${result}"
            }else{
                binding.textView.text = "Enter Number!"
            }

        }
        binding.button3.setOnClickListener{
            val num1 = binding.editText.text.toString().toDoubleOrNull()
            val num2 = binding.editText2.text.toString().toDoubleOrNull()

            if(num1 != null && num2 != null){
                val result = num1 * num2
                binding.textView.text = "${result}"
            }else{
                binding.textView.text = "Enter Number!"
            }

        }
        binding.button4.setOnClickListener{
            val num1 = binding.editText.text.toString().toDoubleOrNull()
            val num2 = binding.editText2.text.toString().toDoubleOrNull()

            if(num1 != null && num2 != null){
                val result = num1 / num2
                binding.textView.text = "${result}"
            }else{
                binding.textView.text = "Enter Number!"
            }

        }
    }
}