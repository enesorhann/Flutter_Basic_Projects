package com.enesorhan.firstkotlinapply

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import com.enesorhan.firstkotlinapply.databinding.ActivityMainBinding
import org.w3c.dom.Text


class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)

    binding.button.setOnClickListener {

        val name = binding.nameText.text.toString()
        val age = binding.ageText.text.toString().toIntOrNull()
        val job = binding.jobText.text.toString()


        if (age != null){
            val simpson= Simpson(name,age,job)
            binding.result.text = "Name: ${simpson.name} Age: ${simpson.age} Job: ${simpson.job}"
        }else{
            binding.result.text = "Enter Age!"
        }

    }


    }
}